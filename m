Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432073F1ABE
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323127; cv=none; b=bkuo1zdzsI1W+gnUcEyUxFlKodk6JHDSljHFSSdB0G4Ss8j1qDl6A7/p+wYtjfKbxxmR8+7rqy5eMvVth9TZqK0X4CxqfmEtvfkqx7hs+zMjp94W+d/BfqnbNr0u5GLt7PsmN3P7TQeAfzWXPbkKNj5dNbsaO3wgvdrPMoyxgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323127; c=relaxed/simple;
	bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDvv8WbWaGKdI7cnMiT8x4ZJi0zLxxkLk4/1zFlzcc5RT8DFawVK3XyGNxlGT4BB2hgT74GEg/+rfTWfrMpnUDLIZjuO/GRwvqJ8CNG8Xq5cjd/eXe2P2X/ZF2PZGBnusveLk4kNpQevrNKnW4ucOrRBpMKCCuQDzx48lespBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXzsa0uU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKFLaQCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXzsa0uU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKFLaQCC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI38fN2801970
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=; b=OXzsa0uUzmnGTHWJ
	qBb/Z9En1hErNvPa27MbhBehPpd1chczwOEhGe9Cd09UhFLt7xgC4t7sKDdyD3ww
	L/vztegtDAyUGrocifthsRChiR6Yo88SAMe7ud6VzqFOJPEpI3p7CXeCgDUJPi0D
	t3dCxzukefTVi4fljz6/RHUoT/ztOmTvPFXDEBmS2OoqNRyH9ECDfm2m5SiIUvvS
	KEAkLJZqzAPEN1qa7zjWfGmCVrk9JYBlfJwxjLVmE4+lr7eGWaIUWVZFYlBQkwxa
	zZpQGuOou1MoKfLj5Gd202+bb6AAPGY4oqtTnNCvcd3Zz5xLf5cwv+AyLfmShENV
	S4ODTw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkwck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:11:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86e8cf017ebso231354b3a.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323111; x=1789927911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
        b=ZKFLaQCCE9aAgihJpxyRRvqXwJP0tROC+nLePw0pe8WBagAPKdZML8kWliWat1LAkv
         cKpbfJwRJ/AjirhcQml5yqOJ6nazAo3/tcUqukQ13gMx+vSOYRihpiSRh0RQ5DZDFt96
         ndB2/Oci3rjkS7jr1Z5ovPmj98GpCWmH051P/mymvB141pKmjmO0W3bseacLTWjW4Xad
         DHB1v85Pd++Bwohbc0tVZ83EBd2Ry1r7ApN25m356tDCQ34n6uncaCDTQcpwsoWzRuVb
         gfOcHsX3MxGGUV9eoSAiKCW8pXLOltIN2gh6RZ6LC6u+LYOd+dPeSVxIVMibigxPzaR2
         WuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323111; x=1789927911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
        b=XjkmuReaK84VL3r+lG0xxpJ6gLvm1jFaDRrnRy5/QudHpB+kZvMTg9ZGwGR9SuW9tI
         r10fz4C0OHOWkRgefxsXSTyzlrj0K+sIAM4X33NxX1buTyPA0fr+vcdHI8a3jC2u006/
         q59BExjMadpTBNv47p4ISRZQ+26O2r/Vp33IfZyEcqbj6p+k9xQKJ+N4wElFJ7+R6C/T
         Hm474km3onxzR8m3zyI0dsCleJWgmRFfd4cR0LqcPxekFCzpeuOpa/UGAS3KI+nouolD
         mPsNAHABjTiHb4Dbfcy1sOf0ErLbaCZypadxibNDu1vtSF4NeHj/VZ4ilirx4YjAN5qL
         s8sg==
X-Forwarded-Encrypted: i=1; AKwUvBynyp+VTILqYsKK1V/tRUa4dn0nx+GGhSWywMrqpWZLQhZB02PgnGlrpbfGWqxsv708Z2KNrlDIEM7g@vger.kernel.org
X-Gm-Message-State: AFuF++loozetP6sxaESjijD0zufKxULKndVBPxkz2619h/K/cL5jyvx3
	bjnS/c2eubF0C5LmbecC479eQFJTV+vG4btw3GFlDZ7GWbbW5WsmjbplLGXsk/GcjphAptW1Xqq
	zmPX/ymLC2AkpxaaUwv4PlhO9nkOWP+qHcGOI3ACCQ1VlJ0fFd+XjpVvGY0qwWCaL
X-Gm-Gg: AYBFou2o6c0KzfsAskYIGvOMUAAtWN8P75Ee4Qs6yZFODtaud5f8nfIXk1+W14WBNm9
	30jIgc0mT5MA10DNnjo5K8fV04dIrtS+rGzpiL5AmpAy2ZosMihGq5Of0FK6M3O+19IoVcSOF34
	bYcCycXVa/5uWrPMRIg1QBUTdUBrTNSbV7zZklViPPZvoyB1nqoU7y+twlWcigA/K4sH3h63pJB
	z7o0HszIQ3WuHeRvxLgd6ktqnZVQIrGvHSk0aKpxzx5Tj23N0QsZr9xrtqb+UOfdLnNJsrgb2uz
	4rH9b2iVpyrHlIlRt4aDCfKBAv9MpZBxrJWPv86ko1uj0atolL6/uqsii7noveoPE6hHxYIE2IJ
	gXjo8mpFom3ZOJ0UtiN+EvW1kiqGkPac=
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr25346674637.0.1789323111187;
        Sun, 13 Sep 2026 11:11:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr25346619637.0.1789323110768;
        Sun, 13 Sep 2026 11:11:50 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bac1c716csm20983985eec.2.2026.09.13.11.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:11:50 -0700 (PDT)
Message-ID: <831b7702-07ca-413a-b2e5-5be2b8401ba2@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:41:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX1Irjp8UIHkJ5
 kNiogrEWEjAsbRTt0POmq31KhltFlgANIrSZh18fGTDERen4UHX0JRUKmnYCZZpr+fgF+fRZ+BW
 sb1ytz20CrxyIA7SbkS/lA+k3imyYO33sfZLccJy7i9kZmIkGeSYGc6k7DniwsY944FHC3v6rGB
 /du4jPZ9NC8t5/HczUT2/SBfBkXjQUJ4YJNNKZLQUOUfzRplsUnVRd4uyOK7Gxq9a3ieKrYKKBd
 uyiGgwk6//x27VsWkZ1oAlxQoiyqBTjrxm/5l+oAjviye5IASpdO65SlfBzW5Fjuu+mcGxklzDt
 d5O5HArm10OnQtcDDW4bW5jPjSDlL3pqt1v1E9JwwGffcumkjc5Q7ZT4LfGDgQOVqEQ98fIKA7O
 zCp/Pn6MVoBA/6GW1nZ/fKj7t35iK5sKwaVffSP0XjLywJ6f84fmaVV0dnYozw17UtaeuhPo3NS
 7kdA6qh+V0gNEQjEajg==
X-Proofpoint-ORIG-GUID: Fhl--45lUok9aUqNJx3sxgpp8U8EprkG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX3UWnMtX6Fb/d
 1WG2cAvZdlQ6H9aMJu/3MJ1crLxaQcQQUchfliesRsZHkSeSdp05tqe2JyVzOXxO6oB06ObsTMg
 o600rTDryROVVXYEiVfDvwta8jPMtsA=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa6e768 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Fhl--45lUok9aUqNJx3sxgpp8U8EprkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
>
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
>
> Keep "qcom,rpm-stats" as fallback compatible.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
