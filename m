Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415913DFC8A
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317001; cv=none; b=HpFcbQJ0kHVooulO99Bo+HIPMdhB3c5nb6YkMG6/6jo/c3rUKS/V0INuGMCceJ/WhlYBGambrAH9MoVM9rvCB/ByOx3D2qwKu9wTf8D1R4Q7axjqmq9HBnPm2lAcXqFCPZoN1Gt24dttLD2rFydIPwQvuoHpudGRP/T4qIYu49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317001; c=relaxed/simple;
	bh=MbxqdPNcJm0Aj5xet1GJUaPO3YoQ0EAZte5YPmJbO24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLf4qpFYpaqoRarSs3NaV0S0cpDNdzmNs4LffCXBGe9JfhR8XXJkXYOxSgEVkIqs9EqHgDJ4/tZrrZRFBcRnDrOOAr9s/farDulAD1Q8Wdux8mtbQHi6JhmOfngiHmr394JtmdZ3cULl2w95sZlujxyDtTh4ux2s9BYMEshYipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp/mw41N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYPKGojj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp/mw41N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYPKGojj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yhbc2911815
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9V2UPAVQF53aIGT+lae1TtiaGVGpbVGhbzFnIsJsyc4=; b=Tp/mw41Nlkg359fT
	773uwT4Y4nIBP0rs6V48GSxCBbJamAulvRFsyYd6/dUk0vBrK/BdAN8TO1SV6dUE
	AxgkK1PFZcd8YBT1K3TfIQBkuIN8HBE2sRI6SCR4nErcYFDvzJ5n9E5CTMPYrLTW
	SBQkYK3pxMnCUNnjV9KpOTd2H3okGaJtrjk8EuffDiMaaqngUqW242xGxZOdsfc+
	xaLe5sR9T2ebUt+HA8/4YBOc0hvfYZ8K125gHCA6IiXUQwJDyZEpBsfdb/Ftdh7n
	OU7ZX741JijaZ1nAjgTgB9Th3qAvWjEpcQSsnTUeCqOyTxe6/U/ueM18TmU799GI
	XSn/+g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm50c0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:16:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so387113eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316999; x=1790921799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9V2UPAVQF53aIGT+lae1TtiaGVGpbVGhbzFnIsJsyc4=;
        b=MYPKGojjikdT+MUflM0maDW7QYc5QSzytaytEoICYgZ9KeCcKEPJkF2dNXdH6foQ1N
         UlVWIq0yGf5QwEf/uogDxbIyXRruz2iva0Mgl5LpqM1mA20gPVRtQHm2aM6u5MX7pzos
         nzhjvQAePKcvTJIsvGJp5K5obNLmuZeLgts0VIKZKFbsJ65Eocy1Q5rLldx7XqdXHN5J
         J6p8LTGoVpPulXTMSvijbnjyvkiIezONgTfQGdudG033PMaH1qlddGOh+bDrExRTQ+fG
         5Bw7sCgeSTo9v8qyDPQPuEScpBtAiAp2qUl4n1uMrH1DyTRFwHDvr0duiWlbmL+7KfvP
         b/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316999; x=1790921799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V2UPAVQF53aIGT+lae1TtiaGVGpbVGhbzFnIsJsyc4=;
        b=Fk1KB2INHGP8cgPRKsg8Oy9TqF29zS5Y44x6C88vJIOi+MGpU5El7mZieJDG+ntz9e
         81EyaC3J/7DG+N9F4t7igNCrm9XvTxHlwEO45S2Q9wZi2qCBzgA89ehvbbvNhQmlPNE+
         CeB82x/1gsJIuLMRe4ul/YB1PltD6O6OVhVPL++Jkz5YTWh84YbFYipk4SQ8BHY+3ijs
         Nx4X+GqjueYvWrWBUCQqQDlJQ4+T9DoSYVUaJrBnSmtUO5dBD9rvKZGy+KO0ATd8Y8hz
         x4NRG03hJCbt26nJ+OuhlSvAHVy2APIV+BC7wkS39d2esXKHkimd4OpWhD6sfugddusw
         rBzA==
X-Forwarded-Encrypted: i=1; AKwUvBwjnBKfTdN5v2DQWjlzbUeWBZOwrcjk5xqiGQ7t84mTpk1v65+hQ7/kXJExQFGhStH+Tc2hLLV95Fi4@vger.kernel.org
X-Gm-Message-State: AFuF++lyCqZLaMf/fMx4iwhNPHZJn006j3+b88coS5y0q/A5f6sArm73
	mjT5eNEfX832b1GUJwS6CaHpFeu4oW3piUOqVM4KgBHCaz/vO0qPBWTVVSfsBTbL+6K4WvIKvDl
	R1pliFQaJlIGQOhN9b2DmMLKVdoHsjmeKs/ft6+PIISfR3Li1bCx8FrklFkmitpWO
X-Gm-Gg: AYBFou28mud2/6JpA4sgHa1K/FRMbsZwUBnVJ5BzK3ZuCupOW2IK3LYbdlSFNqwXxfF
	mR5m+y6jS+mxee78/MhXVQCz65j6qMQZqqKuO/hlBWzXBFCdZVpQIP/q92SaUw20iNcniIV0hyh
	qdRGwnF8aj/PIwdrEc31TQjJkzvBvdZqYDJhFl5jcam//MwpsCDalyppauSdHQP94Vswl5dXFql
	wkEAp9KYFo1j2ZZksm1421jlN42yOit/TYRlBPiZFXEFYZYIZtTOHRm+cmnYJbOI/Bqu1qOt2Sc
	IGz7XEP8R1tKZu6OZISdOZkmZ+LOR7ePuPOkUHLNia2EPOLQWFsZFfGk5nhUDY4PLNbGSWkGK/e
	VNS+//YmoxJruVk9zMkPHsz9bq3I=
X-Received: by 2002:a05:7300:a7c1:b0:341:4553:a529 with SMTP id 5a478bee46e88-34199433ebdmr956252eec.20.1790316998484;
        Thu, 24 Sep 2026 23:16:38 -0700 (PDT)
X-Received: by 2002:a05:7300:a7c1:b0:341:4553:a529 with SMTP id 5a478bee46e88-34199433ebdmr956219eec.20.1790316997704;
        Thu, 24 Sep 2026 23:16:37 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144e4a6b9sm3264979eec.18.2026.09.24.23.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 23:16:37 -0700 (PDT)
Message-ID: <61eda17e-8c21-4629-9aca-a3d93da3cde2@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:46:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
        media-ci@linuxtv.org, vkoul@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
 <20260925060140.154E21F000FF@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260925060140.154E21F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8WZ89mhoUDhTafqBvmqVu0TY8TyrXzco
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab611c7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=GpX4wC2T2iRaT2CMI0cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX2LNCLz+yzPSv
 zEjKQT80Uu4QkZwWcEXGsJ+L9qK+bZ2jlC4yfwe6HGDu1565ZKdKueqC0vaYLvvC4jsEEP2s92Z
 7hx/6MwUDTTIGsgz6kc1RRfVHNJe269wz2gv09oNPQfgzYA914xLeyOT+292WV1/oeJ2atFW5wd
 jjIHcHWHPY4UxHMQKipqiNXsbTj0YITRsEZM+s1Q0Dllu9OtGO4G6FFC0Vu3e7AUvKVxqyEgZNJ
 bZf9QIEorPCtF3XzEA/e1QEdi1o0H9ahGca4f7xS8aZHe9H4CavQN74UfyoWKJTA0zoFeK/2kxr
 P/C4sDfbpVbku1zw0kZPCkTocFNrV06ReEM2fR+nDc0cZUpsZga7xhpi7YtAl/gKKkjD2BtPoCh
 k3YqSksxpcrWCb8UmMuSk78FdjfzLX4ICtRl7vx+t/u/kgnRsbmb5mVK1u+o2vu8M4KRgovOQcC
 uXqHQBuANbCrJ6kisNg==
X-Proofpoint-ORIG-GUID: 8WZ89mhoUDhTafqBvmqVu0TY8TyrXzco
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXxdwSaELzjtnK
 c09SKHrPtMAML97wzkt9vYHtRubKChfjLvgvCKy/7HEjDWCn3XKWzi0coGbiI9MoZZxnCTxnchN
 KHmdrxw+p9MEPNrhBmwzGcg5o1MWT4I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250024



On 25-09-2026 11:31, sashiko-bot@kernel.org wrote:
> Does this hardcoded resource mapping cause the probe to fail on Glymur hardware?
> 
> The commit message notes that Glymur only has three CSIPHY instances,
> while X1E80100 has four. Because x1e80100_resources specifies 4 CSIPHY
> instances, camss_probe() -> camss_init_subdevices() will unconditionally
> execute its initialization loop 4 times:

This is addressed in below driver patches 5 and 6 and can be picked separately:
https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/

---
Regards,
Nihal Kumar Gupta
