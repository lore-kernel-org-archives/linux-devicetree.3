Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F60246770
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767806; cv=none; b=WS9ttkIgRAlVVNCXFKnpqPOmSevPZeIi03dHNj3ETvteZCSpydf9Dm4ddriVMx+dFbmZSFsSRpGsi6sSI6wnaCe0jTu+wlwQRdRPUCdo19vB2iekZD+uAp3nlptVsz/MgqZ2Js2j21dcVcNNFZT1ODWoktpB1PxvCr4J8kt1qlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767806; c=relaxed/simple;
	bh=t1sRj01fICR9PTKM3e8VF0BZ2GNG+YU4LIOK3q2fTZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1zMHuKQKOJyEdYrh+oess6kiDB1aLsi93H9jUR9nKjoiyOfo/mCEnbAxuqXmljJ5vS3eJrXSr+cFserNfBXogd+LjT2YXQEfX8ARdY90bzyO6eWlNXzwAKYOmugQa9Ct7o30e3re8PYfGFBewpVqvARRGvKN6vAqW0B+blYvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olddQH2u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIeCnNiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olddQH2u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIeCnNiK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777c222146236
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 07:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zEULqD5p5OmpS7F9A/Wf6D4me7rYx1jl5DbOPGYsCk=; b=olddQH2uqwbvwxbZ
	BHxnjnTmLIbz6oPVv2fKB2iebAjj21+P9B0m3RKzXvxgpPDxN+gurQ3AloEmngvq
	svXIyKw9gVnItHdlgPo8r0RtunBu1Xyi3L7vvF/uvDYscjGMaWLiVLGpGHsLWAu3
	eU5UlFqe9BEJoROQFcDjIYUHU0W9jXfjVfhpp/PDg3sa8QTvhmqWRq/ukR2YK8EL
	b/Akb5jx3i804ej+T3teCvcEVuA4cokUJDzr858KFzNKx1jcVJPU29fMG55nr3rL
	fR3iFdA6MudVxKxqjcbZG0wskYQWO/RZ3xQHFXcroMfC3k1K9ffz/h/QhXSloupg
	EyBDZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdptp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:56:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so306811385a.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767802; x=1789372602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zEULqD5p5OmpS7F9A/Wf6D4me7rYx1jl5DbOPGYsCk=;
        b=aIeCnNiK+MgITS2xyJ6uI3yNaN/ko/dvznNCGfuv7fwlt9jaNSwCJ5PbgK53Q08C7e
         JOOS3MZalzaV4npIK+AE+cHz1H7XCDm8/192aWuQxcRF/jh85ejsbMvk1scLcmx1PoPJ
         gLDe/L0cfM+a8mmiTVkJ/IJ/l5g0uGVtBPChTfyrx9lpGH/je55k83X/T8yz2AtweSwd
         O1otpfmZaATSSMzv00A4f+1UFWKfEfm4AtXXqyf/pSMAr1Th1uqCJGhxah4j7ED2dlBu
         Hf7lqOsiBwrJiM0BQ/WyMZcHHrxUt2s+Xim0nn7o/047KJGlL0m4RfoIsUOLdcorrYfa
         NzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767802; x=1789372602;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zEULqD5p5OmpS7F9A/Wf6D4me7rYx1jl5DbOPGYsCk=;
        b=SNKBfxW4KVz38R4SEaDhPMn+jugFuDGsmDapiXT3Vy/8VSBZ5OntzCPrBpfjRAB2zg
         +suksKR1CgmvBf8Y9qGfnpDHPRB1ei0DTet6u01H7NeroD6zxEpjpDhPbtaqulItun9i
         LYjgr9xCFTFYGE5oNpWX/rpvqbcLqBqwmeP+uRsXcP2f/rWAH6wsERBrfz0EzInLji8q
         /hTTBC0ZYP6lVrZzfRJLPAAzPSp/jM7tWfzTtnnxIDb18qAWtutAaUcX2Smx+QZhP5ej
         okySaeLm/SDsEQSdvKfvTlPIHIHcfMokBbf6rJJa2tq+igVf2JxrLzla6M4li0j0dQVb
         /fKA==
X-Forwarded-Encrypted: i=1; AKwUvBz8KMEZcyWu85RdKPsCNg39ZDkRIKLaLG4GHG7KCTxpIgrWNMytRglfUa/tXNtj8IpSIQmXrJdWzYoJ@vger.kernel.org
X-Gm-Message-State: AFuF++nzk2z3w0e1U5+JbJD1H7TYfmgiqRDf4eulpibfAcEaKfWxZnEQ
	IhcAO582nMYUr9fF9D1rbPHns0gHv1OcmTqXF+52hxQYHbdnZdgbZrWppqLeDw87kLJ8SXitU1G
	596vcXP5b4PoCjDw3Kn6CqT1JWpAIFZ/NUAyLUDJIHrydmxrgDD5a5e28r6pvNThP
X-Gm-Gg: AYBFou2ROSleyu2ID79iIFnpsmJ1hJ9ePPZypzZJywsgAyu5U3fF4+YKNnFAAayvbMy
	OjiOGHDsNgtwL9cERr+EV+1tLYsyw/jOEKdYqm011gkifPLnpTNydS9cRYNx3yAwwL1J+xDU4rd
	2eWP3Ncnl0C7RwZbc5hiGvHTBD8oDvaQw9uNKOXZ3d+hdTYHu4oBdbz+IpTQthkIWgnyYvwYII6
	kt/dEZCqIKNlr/bD+tucJvl2UKAryb4hvR3jo+FizcnHBVqovbIkOnsV/d+4DDSGOQUbS6Harw4
	t4uBfpjcD/HAOfD1Hat9bgNkwBQijn6LNX6H7q8x8ImX6XAd5BU8TL7jubAMIDGxVyLgPrcJ5e6
	rMwAWtOvkzW0Iv7t4oKV21GUSZg==
X-Received: by 2002:a05:620a:454b:b0:939:93a1:1383 with SMTP id af79cd13be357-93993a115d6mr1276043085a.32.1788767801578;
        Mon, 07 Sep 2026 00:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:939:93a1:1383 with SMTP id af79cd13be357-93993a115d6mr1276040385a.32.1788767801095;
        Mon, 07 Sep 2026 00:56:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm27297590f8f.29.2026.09.07.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:56:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
Date: Mon,  7 Sep 2026 09:56:37 +0200
Message-ID: <178876776172.5819.17556246625173968095.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
References: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0pXMhKBRzr4rG8Y-Ohka0mfrYBHESuiF
X-Proofpoint-ORIG-GUID: 0pXMhKBRzr4rG8Y-Ohka0mfrYBHESuiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX8UZOiCDU+Fmk
 Qj02fsGUYKRvxYbvzsEyC9WMqJvILGr/o86fPLQhND5iApslK/cz9gT9hYuRE/UEHMsK+g1bYxN
 pTfk46ynDD8LdcuIYpZYTGt0Wl9Zd5UWHnK42gPm7wipxYnifP6oPEVTRutewWrRFNvt86iEsik
 6+/ApTukyyHfffpvW7Q5GsimjoQhqBGvlpzWN1aZWgGm2Ux2/mBwxqs657ojPvx0tzW/keFbHfz
 ChWnW4LZoyGxghmAjop60s24r4m0+RwV5IqOhEbi020jvDue0aN9u9NaKqIXRoChPdN8FZeCVPq
 KXA45tYEgNzf/1K2bxPsa53dgK15TMf64gIsKrNB/xE7GDhBga65naAfZt7W2CkpRawlAJGHEz/
 TKvyoh4RNbLVQ7p18LIN5aTfNmd1LZ6XFaN/HRZZjYEmN46SouFPJLj7n4Ae0GIEBCjm9n7N5nH
 5YIQrs8GENaOM6iJFEw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e6e3a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2HO_7AbmPCLmE9qJQqQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX8iCkxhPl3P8q
 DnJLkQ+JD9Oo0ZbTbMiaS/HMfiJii0xS7PNjW3uLWeG2PhH0w6WXxhsBFOaH0j7/K/He3eP8fpd
 mx2DDE+Y8xekqv+nZq2dHrC3TW4gUbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070085


On Sun, 30 Aug 2026 11:02:01 +0800, Shawn Guo wrote:
> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> respectively.
> 
> Both mux values were named "qup1_se2" (respectively "qup1_se3"), so the
> two distinct lane pairs became indistinguishable. msm_pinmux_set_mux()
> stops at the first entry matching the requested function, which means
> mux value 1 was always selected and the I2C lanes could never be muxed
> out. In practice i2c9 and i2c10 got the UART lanes and did not work,
> while uart9 and uart10 happened to be muxed correctly.
> 
> [...]

There were no objections from DT maintainers and this is needed to fix QUPv3
on nord so I'm queueing it for v7.3.

[1/1] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
      https://git.kernel.org/brgl/c/fbfd6d0d3596d072f7546b25228e4eb599f68a95

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
