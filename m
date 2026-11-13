Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578592;
	b=gAWcYYCPrUfVQjgcaGWqWPoiGNhwy5zN2oBv24J6Fo5PpVokcJHc2O4oZtfCibwVWNec
	 FyE+I9Cu52aT1RgdVe5atPNAf2bp9PBABNUGjQlONp+FI4qy4A2BNm1+1hHS8ScibgMcI
	 MsrTpanVTz6UYEC1HwYOvFbv8RgcvBQIbdBf96o/CWW8aPlP5bY0yC47r6XTMA+tO+b0o
	 k555ayPodtNLzqLU/SZvm5W2kGYJFP5dfO9EClUAzhdX0K11uJUerquhovgptAtKsd04B
	 1wHWcql2kyodda4EhO6H3xotfuGYa2tsUAdWTnwcDiScAkzqZly5ggD4gfbodnfAfOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
	b=hBmu1nuq0kXoiVvxZF9FqWrgW1gwEvMUQTXYnyyyBR+avzlBsvqkivsrWWmk1H9PNQzO
	 mycZS89l/jeP4JVAMCbd8gd/ts38mA6//uSd523FODPYQSTe0xsjgk6TH7Tv3ddAk9AWN
	 8+pOervPpIh3cCsT8ngP+1JrpedZeIJcUaoirPi/W82smikLPe1qUqywNSHkZOVx5BZUk
	 kX9gSoRNutLRbfrHBEdddOMWHuIzDNjFbbckG5iRBsHluZFDi4ipJSzQ2+cldF6ntYr7x
	 g/tT1AsjhJ26Dx1xAm38vWgdKwgUU+NpSq8cI/R6w39cdmdVO5jZZ90eR7AYt+59Pdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxaKRxvE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAD606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxaKRxvE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJUiY2796749
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUQvuhQRh7K4F7zLr9SKJq7Y
	llsW7TnD6WQcJABt4hk=; b=BpIKcwokkcfc473Wb1waaTQpz24CG5t2Drjgdfyh
	QAi1XuzySvCtkG84x7BQQqMIXbGfWGCd5ZBT4c9tXoIm9IY2z1fu2/ADsPhBUBjO
	ip3FWYgji6ko/SsIA9YxBcFO0gwqOPD8+elVqrBmJHlvu7l3Tyv4DOJMhDl6QsMK
	racnnoP2S6ZvmxFaSCE9VL+lb46SY+AUEyhmAzfH+1ccI89hZIBVV1OjyrYTnA7e
	5PckpEik4d9HtCOBJtWb11yPWzhA63A7CHMqUb/iNh7usiwfJ/UGOjjeGeeBFBqK
	VelUSdjsvXturnL0DjSwxVn4eNahUQhXRNYSz4S5Ygug7A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6sm4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:03:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c83124d530so1791552e0c.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578590; x=1795183390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=CxaKRxvEJ7eIdjkSbAeOtzK+KEOsA3TLChySfGd2V92AgQ4ozRv3KuKrT1M+DM3ly3
         w56r0fNpuXTxa3m+glhlnjoYftD4aP7M+QAxQA6Jw4/CNFdYjdpjgpMCMXDuthaSF/2k
         vFpo2Npgq5NTZj440bLUkPJZD347sm/aAO2SmSBpb6Jo2H/BUjIWlM5zAAAg2Y42Owna
         xmCXBnPWwhMMSuVQzfHJd0Ii6IrZfCSJcsxQEACWlNPkY0oITwMRXcQ+ZsaJHrhgDrnw
         A0O0Bu2eeMXhPA/tFUylzjnkO8exK51Sd3kBok8S3FRWl9Yyue/Hu8XqkMdJ9K4tUk6g
         90AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578590; x=1795183390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=Ad5Q1llwUffFgcdl9HnBoD3v4Rp30wm3MmI/wzpobvv4khktIfdxnH/RhoM556YQ13
         FdKyumz9E6nujhd6NtHX2I5kbaaVqG6BiBFkCSHo5pLXL3fFRcQFM9Zdr+v2c5miL/dD
         D3G/Z6SlobNP8ac/r+Ay2TPgQbKMpTRMtwaXj+A92Xt1w1flWE67H5Y9giASbJaj1Zi7
         mvpYQh0OcWOskzpsYkLeBeoNcnWODu01UXExUjL/Uy2y5O1lIuujm10uISlHswrkf1Yj
         523cP2qFkYQO8JonWlUBWj8dGOuG4Nma4A3myZ5IRnl3ft2hITcd8lGeknTpV7BKAKI/
         zwzw==
X-Forwarded-Encrypted: i=1; AL+hErFbJXGhRzRrv8DFuyIpY2oDLqY8yA0ISh3XZ59JpkTbsYLz+jGfjgFeQaY65C1rMOay+VWsBH88eipn@vger.kernel.org
X-Gm-Message-State: APuU4Z+uX+Va00qZ+9LYTKHezLPDgZplHXPP+kCP1H8ZNzW1oMCD7DeW
	pzMDj70lGTwWjDbvg9SSpv/lpCnKneYyQCe9mOFY0U0Ha/Tp8iT1wfjUqDAAobKkjtrtabMbZ4I
	3yuaOzVtmwF2B/ulFajzpuyqycJh0nNJmYM3/146oBpAeDB8qPj9WLMbT6RVwYlI8mktKXuZp
X-Gm-Gg: AYBFou000rPcUGi4rRoXkdantpdv9IzpgLH5t0ZHMq2sjyeLfj7Ed7w0AFeu49ekvz7
	aTkZfbiSST3GAGbOlLy9xzJQNVytbJpNii8hNgsV4o502e7U9k3g2STFE6X+htxntiRncupZkeb
	OJ51mkCkjgmbzBE0vpa4YxnGy8DMg15HZBjyXDR4TfHWe9uUF3e/5iS1viIYbpiNA6ySsxuN1xZ
	2wO5quanLrXfEA93c36QTy3Lhls+xeRpMOdaQgUGQ/joBs5jplWza9npmRd5tOt+EnhcgfufSXN
	4wX/onkc8+g9Y7Ko79o2HlAQZy2rYaT7MfP7tYtCt3YqUZ5OdVRkBYOtsuOAb9enILl3R1vum58
	2pKZniRnhD6Tn8Vu0BKUgAyu+6JhJXCG0B64cvzVT8jgw49sMQaJUlhneDmBMJzPjh1BJjTf5ym
	lMXu26DygWRdALk8MbDuHUOK8/E0dDmkCU/GE0ftSIl3TlGffAWmu+26n+qW6JeQ==
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861251e0c.17.1794578589715;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861204e0c.17.1794578589099;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348084sm769004e87.54.2026.11.13.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:03:07 -0800 (PST)
Date: Fri, 13 Nov 2026 16:03:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Message-ID: <ooeojpbsljfgaj5iuzkobibqfv7stvklom32pzqtivswquosew@dfsj4s6cnkbp>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX57VgM+fGpoLC
 QjyTTmwuCDl6ly+xXFi6T1i1ZtUrLOSxu8T8yqyGk0zDyiXWADWK2CRtpO3qOiFtb6ZZ67f54fw
 MOLCvlcxPUtB4daE46XI69Tz2+xI/jxno40yVk9e6rPrN2UyfHT+idl7+ZtJiALoqUPmS/uYou6
 AIa/K/kna66DdToYLO/2+yZSYZTbQ4Njnxhwi2ITcnudW/sXxnf146qTKV74+zbLELkCe8S+1Kx
 bQoRd63XMuQohL7kDJ1BzItZbfiSFCS+Y3+0bPxV0T5mSsqwPw/ABACDUdI3GpiNLR0jv5cHiPW
 6Tgzf96umHW48Dw8y+1wmk1vrnPDTX1j9R4OtlkBF2RAo7w5NDZJUfHGtpW17i92M3J5WY6MdFw
 8TavtPAsxoR4529KvaeVT/WDk3EHS6Fip0TDF/Jl5NHZwYOmdDZUOVgmFPQhcEzr1BRlnkSqtJe
 kDss8B5gn8hw/dQRBsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX/6VKHLmcrKB3
 K5tpWu/z1kTlhsBQvMWDZsj+6tEUU4AlkjcO8ks3xGTZrKMcrRFbGfN2jfYbfXQry4qkOpo8ePi
 qlDtc7mNo/64mqR/eLbiF/fNAToefks=
X-Proofpoint-GUID: 7hw09E97svboBjKHfPEV28xMwRAdthOB
X-Proofpoint-ORIG-GUID: 7hw09E97svboBjKHfPEV28xMwRAdthOB
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af7189e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=PDbGYQxuVRdfQqe5cAkA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130055

On Fri, Nov 13, 2026 at 08:52:08AM +0100, Konrad Dybcio wrote:
> On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> > 'syscon' nodes are required to have specific compatibles, but the 
> > MSM8996 SAW3 nodes are lacking one. This series adds one.
> > 
> > The binding should be applied with the dts changes to avoid new 
> > warnings.
> > 
> > Rob
> 
> I know this has been a thorn in our side for a long long time.
> 
> I believe +Dmitry had recently come up with some patches to describe
> it "properly" - are they any different from this series, Dmitry?

No, on MSM8996 the CBF SAW3 block doesn't need extra programming, only
the voltage change sequence, which is already implemented. Historically
I tried to control the SAW/SPM directly, reinit it and set the AVS, but
it seems it was a mistake. Pending patches (sorry) from my side don't
touch the SAW, the CPR3 uses the APCC regulator as is.

> 
> Konrad

-- 
With best wishes
Dmitry
