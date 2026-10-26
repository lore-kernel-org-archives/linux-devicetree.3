Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997103;
	b=ZSVTGtkTCoZsjfnNbBJKyiUeUY9PAsVuHwMwQTbVs2cP0x4wrqus9mZK0o6lovjhPt33
	 gSrlOPxKGclaez2G/LPM+VvqL0AyPrf5YayNvqVi1ejpBlpXy4WIAozL73knq/EIJJIrR
	 thBSAChhlp1p+U0uZAycXg1S6B1AcFMdiJIRJY3eKlNt8PC87/Itga7FTyuhxSnsrxpcA
	 WcN8dd2VQ28STPGoOpgtlKrRUZqxZ9mMmyXvoaDDxEVdKD2VgWGf2NPt8CkQVuJWCEKmR
	 88KNEagq+YdHykXv5XKBfNm5FEzhtBYmZ2gcABInEG0ipW6rBEHxbKtBW2hz6YR1Ccw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
	b=0SmgF0loBAp32e5LAYbTvLkQKXZyN8OYQClz8nheQYhuW2UiQHJg656VuLQ2jkQK5kdD
	 NevBjLQhDZ+UZa5sue+IswGdbBOlbFxoWkbUC6BMz5/yropCnkynhBAcNRgbafMJOzzAR
	 6zwoPLeSFs7rwZVCGkYvGdxhz6qXS4hm1+4x8E6OaUrG1nfJCi+zUPom9ksJpCderR1Iu
	 CG9ccij0Z87A1SL+z7QTobfqUoqkhaNNRf5J1SkXOkRHbc0ZaBg7YxiOMu6BG07ggP+h4
	 qLogODmxnT7ad/1KylT5IUTfAPhaogzyilX8zzcDlRvL04tijYBbb01ajHkWJdkKx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eg2Ts8/k";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9E606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD9E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eg2Ts8/k
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b87B1907971
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=; b=Ond4bT7d/9XO2XYd
	D6gexI/f1UnM23NhYQSn0iWE+hyBq1P4Ry9So30XS4D5Xe5Wk/qPglXGJKSMU/Qw
	2tOIKy542Ziy07Q5Gr/LEOblvKVXX1RU+xmD15kwe7ojv9GRGtJCF3WcdBYwZcQr
	zsYekdvvpKfeunB8rDmPPoc5i678Hlr1ffDApQJ18jZkEO5x2D6RqcQ6R+4dqovS
	9fBW+zpweKp8zWTgropoGb2TGd+a+Zxa1gWnYgPj9F/9va42YQn8953BSR1iPXzW
	IGAEiiIkWvzOIEJoa5/4pisnWma7oo/XdpJLPL28/ZuY63yUJ0JepNq0KL30yBa/
	ORDfWg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gn6t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so13453980eec.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997096; x=1793601896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=Eg2Ts8/kCe35YzpDLxXXo9pzNZptN2ipaJTOWdzCixkLYC1FIIS2Vm/hKoxrThfcLD
         yQvIdyLrf1w4qkZQQBtkvt6k7rX80scW1dXI1QAR4MHQ+xwh6NuXGUErnIShtrdZxMxg
         ik46YntHTzeUaaZ28fH5SlsID3UXBGc7/pyWPNzI0KWvCMZPkpU50Lfetgaagfz8e89H
         Yz23mtSyQUxyeTZoEmvYhgVy0jQVGviN0mbXyERUibxLlKWd1a361p6zYcneM7R80y53
         nNXLjzWu4ImKS3VU+gaP/+GDX24nM3S8KIGructeMZAmt9QaJVgzFUiny3ESFJRZTcVU
         So5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997096; x=1793601896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=AbDR9xX3HUNZSKwGGeauhQ666V+iSD6zqt6FMDd6KZ+RpLMyGgxcOqHzsBrNv8i7sh
         yLA1tr6mUWdx7IwSaFWbWKnXF6iwBwfk3DCT5wBwSbL/RtP4//BdgR+bswb9f4jOJPJU
         fnP9Ve+Mwfm6MycdvU5tDTEenvjatFdzIw2NU5At4BmL9myZzVx3S16ur52fz+5waKbq
         r06rSo/W7o2s2z9uCT0kII8+KzcHLk5bfMqQmZ3KDxTdMoMARC0B+/vhtSXB2bKNyH/p
         EwEYZiinjv8N21MuvZG7T25Npa+iXvoJhbRMpHZL2AOU6ASNPVZz3/O8JZ3KYgETHjdi
         HB7g==
X-Forwarded-Encrypted: i=1; AKwUvBxH92ZhDXvOYWbn5E382+XHJXwMk2CoV4B18zfmzRWp2yGAN4dJ5hpLQx0OS39de3LUuagq4Jh18rrW@vger.kernel.org
X-Gm-Message-State: AFq9FYLQH/Rq0DI5gA9ui6gOOsyLOP/FgBmMpmV76WiUtS4uzxuGXbGZ
	UuX96ZyP8VtaTmUVIiD/JyYMCxVEMX4/JrrFwo3Zrv49rylU6Pu8f+l/zW/TdfHkLyd6ZpWfqNo
	u1CjzPQL5wSDpJAfR9yXdtibVI3jGV7WYuWWqYDMQa7J8SgxUuKPqxzwVEaisSvc8
X-Gm-Gg: AYBFou1ShTLB2D/hE+UM970saDJKczuAPLw0+j2PeZmwqFzj5wOvSQvJNcFTczbjGxr
	eP+b4YDdW1uLNaem0Gf1BgCoCOlC7ZC1zli5FzfcU2CakqwH+xarTf5fRKV2pja4SG5WGjT4NXg
	T/RD8aKpklWxfpOTI5Z/mRMKd95APehj5Dv1/s3QE6huKCSGf3nDdnn+We2FWbVyKX0J6JVRrVQ
	mszgiItQXLS0nubD6ddPJuMzeo85YzvthCW5xnrP960t1qaggw3TZ0IRk+SWmnqewko0Fg4LkIm
	qtboXvMRdTX4m5MYXyMWqeVMKRYBXNTMEhcRxjrJJtTS5Ycb9ZywPRc8lcLHq+qJtylbNMksn0H
	WgZ5BVZM8LS4aucF4g0fK
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097254eec.31.1792997095478;
        Sun, 25 Oct 2026 23:44:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097225eec.31.1792997094810;
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm14677674eec.15.2026.10.25.23.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Message-ID: <4a520c07-faa5-421a-913c-f75227491f08@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:14:48 +0530
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
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
 <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QHeMq35FnT2AYPb5xLdpJX5IYqpZjJ_t
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adef6e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=orbn77WvMtTVaJTH4VcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: QHeMq35FnT2AYPb5xLdpJX5IYqpZjJ_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX03TZkbRtxguP
 WzmNLDmGRhBYqrUfXqaJMZPXAOnyKTIL7EglwQwWtbeKbUJcKyCC40ByWhKpowedP82VJADYNyE
 39cz71LV3HRxssH504rC7iQAoe4Lil0ONOszWaWRDJGpsAzewd4vORZM2IyMfx2+ftPb5HjkGrY
 X4BSyQskBq4R09p4d50Kj834tLNW/YVtDqSollgpoce6pIn+QoRnG4sMTeOdsuWeD4LmSXCEdS3
 Ax36SB3V7T8tElzgV91ZXbNPeZuWIzHrJwNce3xh0E/x7yWJsD26V4hDdw10glHQHaTqIjuf87V
 zYuYLxa4o4xZTY+O8D1NZROhQ7WG5GLe0l8LzUIqh7LWtsG0UVPE28nerHO+sRr5HbynOBmHJkT
 0N30UoQZ67E7tP7Reof267n+mSXks1qADUt1rhoI/rE05QKgP9sZbv7/vMuJ+PQnrT5G4VoeoDe
 jxylvjBdf9p+PxZi4bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfXwe2ZbGhP3fd9
 +5wbdg10pKzwp2bTaRCqCVeA7JtGXg434m8D4jA8dW51GEEXkIsIiQBNtncflYul2014AraVbsg
 1gNwcCQFIx8+epLJfGNFacpc/5qXye8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026


On 10/22/2026 9:47 PM, Ajay Kumar Nandam wrote:
> 
> Nit: please keep the compatible list sorted alphabetically
sure thanks will update in V2.

Thanks and regards,
Karthik S
