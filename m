Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603825;
	b=obR8ChdJ5wK4BXpaUjUirEpzrMhLxmEN+NoycrpIXTb50ta8c7GeS8PdGnTyDWWqSTVB
	 7Xf8JYidx7jXhnufu85xynW4lbQBa99ADwV40I5PQEBnRP+MvMBWH1ZvtynylC5lxB2w2
	 gxYCv7SEavxCkyZmiC6BRGoW36Gur46Hcb0sqY2HH8RRAKNJvs6CuSW3fZRdtKXX0WzrO
	 TzB3Y9ISzFbgllgtAFErH39Wlnb6wDzY4TD0BZY3qk2tlUcznATYyk+4Aor12MdWxIBOJ
	 qEQJin9YIrQQqE49FacavoeTwghIcVKrUvbQ/p1g/IPZSNzE7RpTHm2nioOxvpTitxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
	b=POyOMNsBq7bO7q6lM4ZOm3Q9VPfpy75u3fnoLSSaerol+sbRD9wdMVwwheYYGlvfOSL4
	 XZgpQmm9ldDA1+4nLqkwoAb14CVGN5Iu7eE4Z/XjJxB3aIHXH9X3BwA7aYhdeYXLUFv8V
	 T8OF7blHI67v31j4cDKlYp1SR/p6gcQujIK9SHR8iP+CpJ4MT5/GyP10sSpjQ3rXu3K2/
	 n5diK1c52FXqSIv5IvLrK4vEFrND38h1MfyYeB9V3cdFD3yzrARBltMWROxVsaDAS4VW8
	 hXSy3nnbUpo4n0VlgQucqf1tr+mh2XmIXc1Wc9Losy6lh33C6XXY0eaYmjt6e0Y2Qig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JrO+Ag/O";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No32w+1B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0213606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0213606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JrO+Ag/O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No32w+1B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mPhj555541
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=; b=JrO+Ag/OwSy7VidX
	92Pk4rprgiR9E8qwi+KeYpVD+V4uTVrN9JteEFpLlUJbIat7Wd3eoTLIAmw4JVix
	DubIzrPjol3HAfgk7h+sKhDxcBu5mypa9OFUlo5AYWlyarSFNoluaV1RiG077jLm
	OBMbPWNaX+43TZaO9/UVaoEZvPTmv5Yu0JpP2AcXS+UDXJ4DJQ+JzMs8wu5z6K14
	czJRIVbjuyrq+9fsGnkiYBIYyrNTyDlP7V0wbogYCUVWLcsugNM962kXIskUf0nM
	5Vx+4tRG5VMjAisEDL4kOP4X3cJ/cAsyPs1rbXBQxV5fYK+/OzrZb567zVW75wKQ
	bYUPFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrdrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2d54356fso16936241cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603823; x=1796208623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
        b=No32w+1BZ/2eMSNU4GWE6SIzQ8cYHLHMZQu8Tswu73OMyttjwxMgtsJ84NCPQaMwqY
         ZseaKziSd995RB6KsFkqH/rqovbTJhr0W5Xpoj5EGuYNqWsLg+6pmeZY/e9Jcl3WJoF8
         DS8d3CzrM8xEX0dwr8tBCbQp3eh3iRdTB3GajR9q5AAJqwMxIjE0pPIlwv8Yqm9aupbH
         PesA1wRHghAD2PzMJH/rJ9UnxeJhWSgeYTMfbGluxly5gRix9JTXEUEsJj+hlrfJz329
         /65k0LODrnu1G7AGy4qbLIkE1vVuhEtOD8nCY0j2Ydn3VmREK/MYrH9eYkKaa50LerIP
         /Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603823; x=1796208623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
        b=j+giRPHDqiz62lwMV4gu5FRlmu03q7kiY1+uWXXO9PLrvRiTSEqS/e1Q8VPh5UUur2
         JcuLF3AfdY2JdJ9zfdQ4MxJMqsixWaOtHQCtcYq+JUNrwL5dbAKrIqYU01B77XpmUelQ
         4OebjFLWHua0ZJuyYunjV9xUzuZDbOPsyHCv+GxxhvkTdlipsg+aA5sYPYt6KopT7PBi
         /jp7rRQoLXqmNVHS7Dt0c1N1827NbINn9zr3TeBr8lWViVVcwxh16uQj3CXTROrRPubT
         m2KSIETQuX+GG8XUcS1+/ZPGSbbxuSzORfpVaM3nv3X2yExvYRgr7qip19Jopor1mlzV
         8wrg==
X-Forwarded-Encrypted: i=1; AL+hErGX0A7lQ3FpmYDRpHExaSuIxnuple8fgTTz4SCbyC7jvtxTjx9XQFBD2iOajbLALJ4Saol86yrxOlb0@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRPs5AofEs1NNc5duELqv+WkklukwMzPkfprw1WqyeV9aVUxW
	iqhryPLeVaUTQhi5wAJSabNCqHMFZH6k1eF3bmI1pQj45XcYbk1Y0ovXs92oblYmCB/klIIvXzI
	hW/+ZwB69Jn8KqRAHfeNaMvQ4fMBz1yPnzcyTp/WJ1B3o9qZEKy9GZ6E41LiF9seT
X-Gm-Gg: AZFdTZfOM9rhlA+gqfSw8LyJF0HGpAe853mszroheE9ZMdqf8Eaq6dtJcd+5w7YARE9
	HFFXeJb2NmC603aVviCBEeDaClckBlX6m2rwijM+GYcrXsiVGGANm87t/l57kNdkHUKAyw1aOAT
	r+lC3H6vmxbYFrVqLaZ8cVInd3lUw5ir/nfV7yDo7pa7AufgUFWn6qP12Pi1SImOE6AAx3zeSDx
	5jB2aODXeOBLB+LRI+oMdLmc7iU/Qz5mzdJ+UJ9OIjO7w+EZ4T5CDpOfunQrhS4aISRRLhLhVA1
	R9We/p45Sux4sxutvNAifyxuYkkrP1I0Rqy9UHMvlZPpMD69Xti1jF9VVGjd/KIPsy3GBDgRQWW
	h5RAvbNbkY50aFSAnm4P+d2Ms9taGdozM1J/vdJS42C4MFrU2YfP+a9cGLM44v5W5Lh/nsd8=
X-Received: by 2002:a05:622a:e2d3:10b0:538:40e2:ba55 with SMTP id d75a77b69052e-55d767ae0f0mr292211271cf.0.1795603823179;
        Wed, 25 Nov 2026 02:50:23 -0800 (PST)
X-Received: by 2002:a05:622a:e2d3:10b0:538:40e2:ba55 with SMTP id d75a77b69052e-55d767ae0f0mr292210931cf.0.1795603822710;
        Wed, 25 Nov 2026 02:50:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:22 -0800 (PST)
Message-ID: <f4b01bab-8ae2-484e-90aa-915ce5a984ba@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:19 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX21nSzRpWkAdp
 YdzqLyTkWkFG4t403pfZIBtY6yVTXNvp3xKuzlOrgBdlvdLrT93dsuhE9QKbK0ZMvD0SmwsuvBY
 zYGoqqsDOhH7m7ba1lof5qJNYyKrcCb83eU28BUf6kgp3QOo3YjwhaM2VaYpxhUJZf0YUX8ZYnr
 M2qL9ZsZuSgYYW3rkuo93mFxtqyRahQ0mU+Fjfb0+F+qvNMSqJZippMahU07ezf6N8pn50rYgIp
 qvbUof5NhwkMgUfHks4i3cGzhYOYcUbRbSP6ZQjAFWM5lpW9Sv7KtUg+1h0+n4bwBQ5S4Vaoc8G
 lrNNByC9tIQwr845PEhlYxnMOvqBj830noM0xVnyHcfXhDbOBdpp205PQtt9iOoDv7yxTfvKc6l
 ar/ChPUQHYwdC5jFY2La/UR4M/gxkmASj7F5SpEx2aUekdp4XD54cWtMDORdy+f/t5x2Oe8Ovxm
 eWrSmA44TCvQSrU1NHg==
X-Proofpoint-ORIG-GUID: OA5qBFWRBbHGYc6c1DQZM64WDgZiAf9L
X-Proofpoint-GUID: OA5qBFWRBbHGYc6c1DQZM64WDgZiAf9L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX6a27AFNpUJOn
 +l2/33+cgdoRemhrgvIi5kmPp4hIOOX0khSe99DfSzTEKzBcAlcGYUh0uWQe54lxpKxfMXZVrJl
 CUrp5a0PkyyKvvZUXA7CPNUjcH1wwGk=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06bd6f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DDIdZFHhyExMSTX-0roA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
> function as non-strict functions") converted the gpio function in the
> milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
> cannot then be requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() for egpio as well.
> 
> Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
