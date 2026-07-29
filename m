Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE74A2E3C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334167; cv=none; b=bvIoOMSvxvi3rs2olXtfTLLSEA+1yCSstEtU7O3cQJxAXxY69JC8H/HjUVDxmGfP73WD5q/M7cLtMbWOKhMZVo6/VeOA6xnCL3u/sHc5+k3ujgDtXGTfxVJuKSU7JFRFj14D0OhOXQaXJukzlIIkuCpCxI52vVBF0+mptc84moE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334167; c=relaxed/simple;
	bh=Zy7hBciUyIugV+s92o89QaZeykUKHMHAfvGLgVb3LhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMDfe2F5YGr/qftgR86mH/bvbN9IJHE1SbyCQyJsgcd79ybzeYMQLsHkmsNvSpl8RMOxVUYDmJkEq1Zcq+t2787qRy7Lt7yMCGkzJi8ziCeEC+9fEoKxbHyIuH9YJeAG4zPyXNk/XJPb6eJDjWTP/Xb4xgaXMAeHp62XWihutU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzlO8/bQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1TcOnaq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzlO8/bQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1TcOnaq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD7teZ2321986
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DusuMrqmK7Xkr7+tt44NqOOvjtN5k/UqrrWbdzwkk/A=; b=BzlO8/bQu5cEXJVJ
	pFG+Lg/YZMw8nuDw94NJBHvw70QNYuHFI9jq33/FF3ySohaprCY8UTmNllCIe/UT
	1yiwpjvL2zqyqeNCWbyaHsdKopZdaSHSOLn+l1ak8NVb4xtlDpcmAwKKW6dIP0dX
	VspURUvkziyfg1H5tzdXHpJJTBQUTGxv/tDPAZj0B3fKy9Um7Syxp173SMZDE/MT
	qMzBw3YsoxlVOnKXa31SeWzOPMALhP6kC2pmMFRfA47gZvDHveg2TrXT7Qx4Mgbz
	Ur7ig6eZKusGS74uQK9xaQz3X/phw3KMYvi6u77h2EvBuwFph3INko2FVX2h2sm8
	4qrGuA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgx80k3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:09:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7530aaa7212so24920137.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334164; x=1785938964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DusuMrqmK7Xkr7+tt44NqOOvjtN5k/UqrrWbdzwkk/A=;
        b=g1TcOnaqpy9NJtKuvMN9AwJhrehq8L4lfoxOVSW1pINrB3Wq8d1ePJHhHN9L+bJAeH
         OoRqz3ax/Ijx3xYbm4GlwYxk6D/BeJgvSij7h11qe79CyKJRr/pX3TbRfwtgP3qDk0TT
         JCyzp8/XZtss4rnfyPtS+y8Qpvp11XJCHoLDwGIhZHLEL7zFaZLTqxYF+3J/ucgX8hUq
         MgEO+yKogEAROKrHrXsmUR15/+2IXSL0haLOShId9TI+a6WtcHTZHKM6wTX2Ck4HusqS
         Vj66KYxw25eA8u3YK5I6VfFgiqRWSpOnXTqKzzb4hRu+OJFVsdrLPIQ+IVGtOZHwOFn5
         Un3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334164; x=1785938964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DusuMrqmK7Xkr7+tt44NqOOvjtN5k/UqrrWbdzwkk/A=;
        b=Vexj19kqfz18/Sl17SbH9X/lhi5yyaL2ciSZhapPIKFoxkgLbbe669GfkVDo0tSD0y
         lgD4HXzT0s+2xN+0ezFEtldfi7TZHgevxjV1FDmXzeS1QsrCNubmbQ/Qy05TUd8Vv1ad
         nyhPTG8l4Rn4Amps9Ayih01+S+7hHTQ/yLBXi0bb68qARXhZKUkYQRUazEIbM+u8spOV
         9nkRlc65B1uKtu5nofnq6X2XNMfUW7NPWn4tQ4tetsnFZ8s/MRuUYMKLy8vYhHajpVGg
         j+lzvjMOffs0FmUsAVo2rsMJN8PBjaZ14cwTd3XwDQTCimyAy4GDQzFNb6Mx05vf5zkl
         aD1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvJaNKa7F0X4VSCv39Mas8dDqgSt/xsMH3gqcmWmmyMF2f05Vv0FS5i7lMxwKpeQGlUu9TG6WVlenu@vger.kernel.org
X-Gm-Message-State: AOJu0YwhduBfN110FsvVSedbEpRPDIDazt77VpXUl4jl3nHCEgvM3zPt
	fj4Z5O0wgPVMx0qYtwnQtSWE7OrSe/qbRd/NF9Ic3bUEAIwtv05MIbJb4aMP91uLxzOX7LzrpI3
	zrmK3JbRfOhkkaKmELgxn+/E9FnrjjD1cTE6/PzYoKVSaxTqj1367fGGLYKvPg3fh
X-Gm-Gg: AR+sD106GgpNbvZxXEECph3it979Y9GC2KshQHgJhcOMo0uTHqE95wpNZAlAiXgyX1I
	B34o2N9kCUEZtAf6ZWBeQ7vpNdI6VjgGXRHCRbARgop8g+qu4GSYru/P/eqZwLQhKBlVWudrJL8
	LxTsURi81N3UTUl7/G19rlMwNbPTxtefWkhX/CmuJE7hv2cBQ/Vk69dHHlmoKId2tMLfIUmUNZ/
	LMUYArpSAYUDjmjXwSNv2nreH3w/NIe65eqjfyBNERNsaqIV5ww+pmfPd8zkOEmS/211eZbOn+E
	sEg1O9420Y8v/rajWbmb/I2+1hCWJRsQ9fupesgEv0lbVr3yFyqhbxapS9dM4k+ddX2odW6CWlK
	kmFz1rcKshtQgWGObMvbfkV/Y
X-Received: by 2002:a05:6102:26d4:b0:72f:6669:286a with SMTP id ada2fe7eead31-7554dbf2f1dmr2463111137.2.1785334163977;
        Wed, 29 Jul 2026 07:09:23 -0700 (PDT)
X-Received: by 2002:a05:6102:26d4:b0:72f:6669:286a with SMTP id ada2fe7eead31-7554dbf2f1dmr2463061137.2.1785334163511;
        Wed, 29 Jul 2026 07:09:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d78f3721sm404119e87.64.2026.07.29.07.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:09:22 -0700 (PDT)
Message-ID: <20fd4118-4c69-48fa-838d-befc041cb399@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:09:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfXz3QnaKLX292m
 FcLcv3sxcUBv9DZOVSlfWxuEe9M8oxE+KhvVOsUT5iuk9Ga8VGvt9cjGf6zlyydt5cZgpxbrAbK
 bgDUs6jcsMjNaDoXyKO3FaRmAcJA5vQ=
X-Authority-Analysis: v=2.4 cv=MZdcfZ/f c=1 sm=1 tr=0 ts=6a6a0994 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EpawiZA4NEOSy88HQ8IA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: PmecT-7wXGKTfjXulcNdfjzXdvmfbN3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfX7SQuO7KNzqRk
 sGj6uGxAWCr8PYxdBP3LQ1WasYvj9Lee4Kaq68/Kl26iG3QFHJYu96/Bc3XeP5FNx3yczJowrZC
 UGWB0XUWaE+B7+xs+syE5dThXyE/Omswlz2sTgf2SMcfWp6BtIJQCSpPr+zDQfbQicCWszLKG3l
 z4vMIZP0EnA7M3xJ46HWPykHXZR6Ju4ql+VMjrJxjidnI5oSYWL9dDy3Ki9Bia4GayWUxZe9PU/
 vPBKGl7AOYt7auugjNKKEcSfsUA5Gyr9MkZOeiofRpht8dN9Rtt5BiuMv/uY7gXC9fEvM/3wH78
 9RRkOED50OEeuutaf9drfe9wdoZK8N+1W7U6W/WSfP2FDpbrsIuAN8tk9Mpnf1mMXuw0d13INXr
 e8xmcN6VJHp4cneZ2bBlwNphCyESBaYFi3bJiGX0cTcUPL/fgCf+Q5hBNQkVrq8HnG+x6/dirVq
 guK7Uoj9ZvfUJfMQx1g==
X-Proofpoint-GUID: PmecT-7wXGKTfjXulcNdfjzXdvmfbN3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290115

On 7/27/26 2:51 PM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
> 
> The surviving cluster is re-added to the cpu-map as cluster0, since the
> kernel stops scanning at the first missing clusterN index. cpu6-cpu11
> are reassigned to SCMI performance domain 0, as domain 1 is no longer
> present.
> 
> Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
> imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
> 0x380, requiring an imem size override. The rx shmem (lpri0) stays at
> offset 0x0. The PDP mailbox addresses are overridden to match the
> Kalambo SCP firmware.
> 
> Add labels to the cpus and cpu-map nodes in Glymur to allow derived
> SoCs to delete and redefine the cpu-map entirely.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

I now noticed you'll also need to override the PDC ranges. I sent
a fixup for glymur/mahua (the map is common for the two), but kalambo
is different.

Konrad
