Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013EE524AF9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688046; cv=none; b=XEgxENQA8UC9dkInHvezC/8Dm0TVnNR4324MXSjULP2Cfs49ljX0czbzT17U/XbPlPK/Rxtc82faxMoeTnIs5vQGmtUZZekiRbmqaRf3MpGZOxKhO41sl4oocdeyX3UX55Mp5RIoWfoWUV0dperXj5FKsS3WSMf6Tur3pRfFiL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688046; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuryINa8WnzORPHkcPOtOpS+tO/q8WbHAW6/OSxZQxgycuiUnIk5X/q4oWkL0gF58ETGITvMV2ZV2IDIoOloOCsS6q/8eXWg6mnZs/P3TJJpKkmhNJXWkcUqkQaKL4EeVNS2eI9IWJby6hbm834u2hSUVjb4lxvvC7eVex+Ffyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Uuq0gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExIiVKHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Uuq0gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExIiVKHj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCrITH859712
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=V+Uuq0ghWlHXxC/cS6ZROX+vjP3BZfTZKEB0TEvj
	GcTNivb2V6exptb2l+M2RvdmxVPQjM4G+8QePtIZlZS34qs+k1zsEwFg2655uP2G
	xJA64+hFb9I4NN35uFhmb4y1KNhllDHTfdaoOQNl1MXLutbltgUoiNk38CIWnoPg
	+wvv6irWZrF5FleeP3Ao0ZVVNlF3KE5TsPFK5SjH1VBsV+hQSnrsi6O3vlBq9LaU
	mLIOE0kN9jMgyrfcHv9haPdsUQQke1m/eeVl0cm/ZG+T49bKC0H9X30oHZwctmNR
	BUG+ys8of2MACreFfhvVRivrrvd+qMV7nY2FjzVtgCSGlA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0hkr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:20:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7ac2663eba2so3017943137.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688042; x=1791292842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=ExIiVKHjCszga+qt1vSukR3CXZcAwJbS81GxhUD0S4aAuuDqzMos/h5OkitjhYvs2p
         USel3uw4diFBqD7aMu17nFAQzkRKFRepSjANVJzH8VU25E4J7UBALXTBxCX1pDWJfnSk
         ia8ha5JhoY+lTIbXxG3eem9YZ+8oNKJzIPahEm2wH/JnP6uaF43Bm//kcGthfIvcK7EZ
         1NJfVWzhqgL6zo+L4mpvUZhxHjRq6BLx4/esJjFbzrraLbdImVbyJUqTFgkMykvCudTp
         YUa+SSChCPxUJtk9p4+ndlt2WwQcPDLp29Or+jqapwtBQfVMJpVY2NiK/z8jOYV7c7hv
         jhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688042; x=1791292842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=PLFJnTk62TZ2AnlKExOrzKytxBS4/G5/kLfzZVzeV8h6xT3IXab547FFQaxgserXH8
         HGXiIatAT9AazOFN+Nl+m1206GTMBtCLUFMhn+HOar8dFe/cpBe2w85PxRq9YI2M4BUl
         zU4zOAhJLb9vgQVus0NZH+34YA4wqmoDEy9Zbphi0Fv44Vyt6qIUDDPo03zRCJZyVipo
         VlmYX/JziLt2rSp6L4OEOHTBQcUyvGeqBpN/sC8z/2B/C7zZxWv81GjJPN6l2AnSwrvA
         jncvnPydLTb/mR9vcvxl8teGUqd8701W+qT6WUeCZGhT+UYa0XQiroUGf9en1eAxsWRZ
         azTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx65himFqUuUJPvYw90+G73Om6uHGxvXU3znTqcV8zLEIN2ApA2ptZ6lUeUe3iTIekVDdev39bCdBEf@vger.kernel.org
X-Gm-Message-State: AFq9FYIeO63m7CfARj8r9KKz5YB0NMXCf+mcQsZPs+yiGmQVrc1fgemT
	/Q0x+oIOrXZRlVtjSsVTGskpo2TCmzOH/2GJjqDQHvZCU09KogAg0h8F9SlCoWwO4JQDX5BAiVM
	FDA1FGJic2R9/Tyqv05XoToKyigUbW3P9/XxEWG3DZfmHbV82DgoLLNROsyRV1Mqnj3VFBjNj
X-Gm-Gg: AYBFou3xf/Fn5VdFQT1kbEIn9DSZ9YmLq4xtqHrVn9EzWlNNlSmswp5SN+Y3evZRshy
	yxDgpvA3x0HMOYIcbaG2h65ctCYU0K1DdWD5pReoLiceS/6UIRJb7rK+eqcMsnRYUWZQsijm4Wa
	ooXWP67fPuPsshYssTJVaqqz2gp/jgSUdPfcc2SVs2b2RjiBjgHancHnxJ3mLD04oul6eUhWM6i
	plCkruNvRKI8E3k8UKZNXnNhUXZ8ws745F9Q7YovwvaOmsbekQoRtJLqLktlKjGkJ/BQE6bIlWp
	FYkEXSghSVjnVyiz7Xng2pNppaE269OVXJl7TBiLjvVvDjgDr4BoJuMN0MaB2PR+m2pGqfvcp+I
	5ExBasiskiu/CJK4=
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061157137.32.1790688042207;
        Tue, 29 Sep 2026 06:20:42 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061142137.32.1790688041617;
        Tue, 29 Sep 2026 06:20:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm85417285e9.13.2026.09.29.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Message-ID: <bjtvryroi4ckhhlhllaarccyf34uxllmfqwt4jzchtrhwqnuub@7vuypzfxbf76>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX4AcxiKsszXTh
 lpuS6yJfZZXm5JXBm3+22wOd8CWNeqPVXD40BctO/WS0+Wm/wxHKGtqiQtaerehgYiKMKQN/+yE
 n6J1MRlWkrIXN6ka4rt39P8z9gFpY8k=
X-Proofpoint-ORIG-GUID: AZibGTq94n_6U2GLB4zXHCxdDdwSlGb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXzpSd8rYszLZj
 ye4Xa92/un6OxRtGoltuI5ar6bjOL61+lbOMHlFWvfRMmeOZeJOWY0LkaCsXS7Ym7xeLM11NFH8
 MzKKsYqI2MksV992F1xwzS3MtGHrmKXlWqGbWT4gbBv9HS5uR81K4/8AMKIpf7935nKzF32n/ol
 HC+MRkm7bDjMy9/2v0EIAX+ix3ZEdMl04rk3mc117AR3E00aHck4Vpql8UPBeR5ILBrJeE9K8eN
 TbOfQ1WrqIl/DSmdYH3k9Z8dPX2+Pg22qnD5Q3QGuHpllw7b8YlTVrT3OTX+eaYvMeaIaBaMR6P
 2c/Xd8gAbeXuYzZWiHd73vAu65Tm9BBwWu7lNIkQjK4+ADyGYSi/P3lb7qKC25fn4yCdsp9VSEp
 GBeTaW66C/HZ72C8MzfeeERV9W+wPIXzEb9FjrLn2Gi5tb81WTuhzejlfPB9MzOVpj8akraaFmH
 vqi8Ot1N1Bf7X2dKibg==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbbb2a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: AZibGTq94n_6U2GLB4zXHCxdDdwSlGb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
