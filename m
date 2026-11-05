Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869012;
	b=DRsdWLT333IjSwpPqYdIPI79KUu4WBlKHPeDOEr9sRTv4wKg4uBcPDi14a5pT2qC8iD7
	 yPVZ7cTuhAeaUjwBTVV3ClUPCJdYoT0d2EdB85czj7fr8qRoMO2iFLdLoMx+WUlZyBgX7
	 ++kQvK+cPXoYZWgP7x4FHVUoI+LO9t38iLBhEAHdNMGQLZo+cB4Jo/jDWIT9VmqIEfMtM
	 ZuN8XzOEjLDFLLgbxReU7COi8yQOI7xXP8rwfP/VAaBa+XnZ26vjPeiqh3sLCg9NB+pZh
	 Mm+XPFlHR4xaAfllxt/h+UAPF8R8TWYiK8SEkDy30cUyItGVLFtXh/59QhvIGnAb8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=;
	b=MrBAXh/TZ2CXnucI3XeIqoXAB+uyHVUlODq6kWkUproFAU6Y2tebl8vrRgdY4FzaekSo
	 9faqyPktemswAYHTyrmqOOU1neCNgeVQtGq09JFNxv3TTYY7sa0cpaCSVSuBD0k4+XPRK
	 mEG9Y0y4SicyC+hWO3e1Rh0FkfDTNOvwu26C1FMr9cjupYPSndbmHTeSVjgIH+v5faf9d
	 XmoeTitrgiYT8chseLEtGrpEhnFwGPu/Cqtsjhrsep6F+EXquh5UmWpuVg3L46Y78P0TR
	 X/t7+qiSYqGJbH94O4q8/0QvoJcL7RLB2Ubp8JRbUss+tc2bwLa0KIy3C+K0s3Xh1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzdTrDpf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DFuP0kYm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A139606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A139606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzdTrDpf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DFuP0kYm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UBLs3819657
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=; b=GzdTrDpfC1rAeoaM
	dgE10Er9mcQEQWnKg+GI7/lhjskwclnp8YGrecIamMYosbtSsUKL5iHfeTmM0kYZ
	3Kb3ZWAgPrwa1ys62FMsjO3O5dAwlv9pYlhMbHNBvI+i8cPld1N+v0cbqCHv0fkg
	OFmzGYr7ss+RNCjHbHfiJv7L5tKFwXEBRY4FiG8L6HEe0skaEFxr7ZeqBpCXYdz3
	znhWx815s48MxamSgNx4N5vF+UHgJHWlNM2AYYKHOgGmo8V76JTEDZpaHxJSXOyj
	kfYXPnkfrpai19PtS2i47nkKNWeW9yYVjsCt/Gnr3t65fzonWgWab/5fAthdNKSt
	1gc+tQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tk2e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so48826385a.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869010; x=1794473810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=;
        b=DFuP0kYm4lYk3UfbrkpQie5qTnEOYa22ufYc7BrEPvsFJtjOJs8nWkA6ScSd5pMuCk
         0TD6OoyA/YEvgDzrs6y1iOTp+gRlh0FyjiZcf1CE5qd4CCn5nA5x+7+fsejMJdxYMFD2
         SMKJ4IPHkWuzTzzLgAscE1Waw06jNo1Q7ZveDWlbvSPrQooA40gVywMs2q1EDEWGhKaS
         Ye5AdjaLJcc+R+h3sqVcNq+Ykd03FVkQtvAsRKaFrOjNM2s3QdQNA8Sn0x15jA6qXCq4
         dsj0GC7Q8cBFRl8KZIOPpdHISMzHY5Gz/3hbKLw71WsOhsISn7cChnJEuq/St7i7d3yL
         4Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869010; x=1794473810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=;
        b=Zt8GhNcfF7a8NNXI4piz5mVrzeJWle4+yvCf6K8YH85VlIVL5EYA+EpV3k19uKr6KY
         gRSKNZgbCTNc6DnwX5/RI/RvW8WqGvvLtgiiU7I5ZFdCleHnSAXs/Rq1+00ftFtSJCgp
         odsjuuaz31haRyscvWHlRS8dDAbr5r/EMES966wl7OB07hrKKrgIsEPbF9IPwKhosmJc
         F/U4tx2ZAkCRd0wQy3DeRB9gp8ExyfJ07KSSKOJhzm2NkP7VIa4G2/slIkc3fz8fjrRc
         kGM0a5nUslJcCYI8hU+PovSfUNDDvTqRall2LMwjWFZZTymUN7f82Jm7I0wTqVzjoceF
         8xhg==
X-Forwarded-Encrypted: i=1; AKwUvBxvQcSd8Uoi7jHAl5bS42fN3TTiJProerMMu5tQb9ZZKiFXi23ASX/WZSFSStW4w3e2UJcHlMPRJAfl@vger.kernel.org
X-Gm-Message-State: APuU4Z+dqbk66FJLUrfKEaVOh4yuwPuafy7yOy7hBGRfZJDOEByc4iqg
	Jq3G+qKHQx1OTXt5YkWYyYcmpKcdDRXe0GtfFFc6LXVjDbdXHO/oWwT81pXUEc4XeKA7LalhkWK
	oFVycpG6Uq8Mqx+xx/SuACaniJpg/CaujR3wGVNAKjDUxDSHl7/W98WL4POkS5rAJ
X-Gm-Gg: AYBFou2ImdrMTSgaOjJ5Dx/a94ev6TMA9M62r71S6fRewI/puwZai5rohhK5bTfx/qh
	xfNdJ5vUPFwKJZ7UrOMTaoZOusfF0x5ANa0WnGXCVNqdWLCiASkMIOqEb4Y7Ekf/VGwXkO313vc
	MVFh9YN5EZGdPeb17ZYOIlugG2e3ZXP0M8PK2wiLzDPvSA3h3kwqWbibUyaeMILoiIrzuiY5GRO
	ZfPBv8RQrg63ZqbF8Fdj31LztYRSQvCqCrZGXI2ANYlKltWe+Y+DWdbs9nSCt72FyXybsNT1v+k
	lypFr//h/BXrBvNIcA/vo+/J4xLrAnPDjsYwxi5dU32wDzxw0SFoj7uP3TlfAmexFrkCTNlfbLM
	RraMNrQX/yfnudH7NYkg1iNGvWVxqpSFqnOkaq5sUQPfIZEI7tZNfOO8TdAT19uxo+Dyc
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr2712714485a.1.1793869010567;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr2712712185a.1.1793869010034;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140005sm158643266b.5.2026.11.05.00.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:56:49 -0800 (PST)
Message-ID: <1e26a8e3-e626-4049-a2a3-cd3abd62b4ef@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:56:44 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8350: Add camera MCLK pinctrl
 states
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261104230529.3040285-1-vz@kernel.org>
 <20261104230529.3040285-4-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104230529.3040285-4-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX8jUjddsjXaVx
 EsWAx0DzcTHHfoq8IqZtJNcoyEvftJvoz6GJwcjuy7FCPvZICR3HHjLz68ye4Ir+7LTyb2VfnOH
 vPqpoFSfDr2ram1ZSxl73jCdlldpG/Y=
X-Proofpoint-ORIG-GUID: RuL3DRf4voOWiSnFsEFrLIOziEFOHGhw
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec44d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jXeCVmtNkXa6rvJdNsEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: RuL3DRf4voOWiSnFsEFrLIOziEFOHGhw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX4XyIkR5HD5pv
 xdBgFBRSuVImxiey+2mnxymNLt0RRPsvY0kHGUiqyOSdnbxWYY/mkBJACO47qtHJFynkv73h2el
 kp/FYfjcvGn0kTebIkBmXYqvJsvFf48WfqHyXNbXb5DhMdNcgi9rpM0WXYMq7ggQpzWXG0f4ZuL
 wTjd5s7YdCqcBMh2FpZph4cxlyUTVQip7RwkVzIr296USUkx6NLnqcrC4l7VoOffYbUIb2NbaVa
 E15+01Lwx+jarjjg+cSwbSSjzVl3z6B2G1+AGibDAeYXW04v7BU93coiHogDSU4pMCDAt7Ky00p
 0t1MDOAi3DZ+y0MruvzE6t0fbWL8Ro5Xgv0ZHPv0x9hj7O6BLmr5XSChDjGudU7vgRGrgGAX5hy
 lH8Bc/LtYUXR5628rmMozFCuE8kFG55y9e5ikuPzDayOLbxxqPIsRkafChxAUj45NWGTdOwxQZF
 ymP855sktx3ks42NDAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 11/5/26 12:05 AM, Vladimir Zapolskiy wrote:
> Add pinctrl states of six camera sensor MCLK output pins found on
> Qualcomm SM8350 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
