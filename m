Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE881724
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371850; cv=none; b=ulZERh7STFjMNbz5kIltlvJx3WPf+BuRoE1kXBPjFS8QD583cx0B3zp4nA1pzESM12Y/3yfM9BIp6j+YRAm2sLsXu75jfnXl12cQQ08dF+rhMhScLVIPVNDUs9AmikfCfapt4LVn80a1RaWbNnMHGElaqkaP53/jr1JN5p1Fr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371850; c=relaxed/simple;
	bh=6E7eD5i46s7Y77mhiBVLdDFbZv58IH6wFPqFdJ++ZsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lygggSuikO/fgscNXx0eitlUYcAYjhtDBCx8J7ONx+MWt2gvtzXbJsByx/0NLUiE05dl/UwfID/w9+1YybBGalWi9ufVhJsBo32rd8UIESZwXGyyu8Zqhg3LZpGHmklI+jsHyDR4laTZM2KYbK6X4xvYQ1w8SZF3n/b2pslN6hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7OC17Qk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9SC9jes; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7OC17Qk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9SC9jes"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SEmT3351944
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IIRDghMKdS7lTK7Oj9uzZshr
	yaDadoJKytPnTqaUWgQ=; b=i7OC17Qksnj32zlP30KCMJWsmzza6njv5lntn5dG
	re2alAt6Il0m4EajDEyI0gg+QIHp9EhM+SgnPhXyQYqUDyJIpL7Z+rol9Z8Wi3v0
	/cX+OIBunjvq424/ZT62eT5Kc3G3I39tIxRawS25lVaiJFGDgiG3/KrT2EUNGIIF
	LH+cdFO1Rl6Xqh4bmsnalhzi9zAEtiSz776w/N0j5K35VLPGFQ9lipYcHtmdId12
	/EluztG7NMNckUJ5SC/qHjmX1unNsdZiLHQOAowX9ofyyWb98WlytgO0sPeYyGU8
	M9pWj7XSoTeHfWzZsKbgVYcyKD0FAXAOLHL8zJLkMbcLSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg01y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:44:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91219341db7so51474456d6.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371847; x=1789976647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIRDghMKdS7lTK7Oj9uzZshryaDadoJKytPnTqaUWgQ=;
        b=D9SC9jesXaLykcir4Y9wyY3QHECt86NUIiWMAaon6ThNYLoj4r93EYKus6JRUFNtJU
         DSZ9/El8P6rN8wm2LCQUImZjB7NTpDZjMgtcQ3Eb1ktxv8iJB0SefIbBGlg30NBK5SgQ
         KAEO9+6Qjkz5dsfmHnwaHDnybGWv3YIPeVL+jdUaNtlOXLT6g5VHNoJQYzkd35fTPkVU
         is+VN7Ua8FOHL2dZ5nlwSH+xL0xcj0qpRW5nJ5YdWR27B+FB7xTfmDYSIq2fENLuBHbc
         GjtwB+4hTizz3QdL2wIQ1Ia3n2g7yrisPAFpADSs75twPEeT1EoG6eesB4NNXEQ0Kxs/
         py8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371847; x=1789976647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIRDghMKdS7lTK7Oj9uzZshryaDadoJKytPnTqaUWgQ=;
        b=raduMhhOG/hcdwwNCchs1g3n5NvzuluAgGnlQ2amZibngULlO1FaYgJcLPTOu8nXny
         rxRcIe1rQ2cXP+zMMZr24R3OvR2+rV89UHaLO98T5SdKqDQkz52Bn4rBShfhwp2/N8Xw
         TqQblK0f2CVRndYgvU28xGxggqIj9iaR2+a6JHH3EAABZa7Y8sQph+sXRDVzbhZviQtY
         001vuk0NCmxTKsapZ8QkRO2Rf5UVandGuPdJrwc7TmSahHT+vJS4qVvgTm5PxDBEmVKu
         0NVrEC8pkHAO7SOX4SBBjJWpZL0U2irxszxTECRXjVTsUpvcohTDUtExvOsmStD+r0AN
         Qk+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2aWY3XnnoeirSYNvk2LFnZ/ZkA2zDG3uRCxeo78D5exgCqWg53f/7zwBCCy76BNekPJJDkQKtRCyu@vger.kernel.org
X-Gm-Message-State: AFuF++mrTyvAln1UI/K6WwtOKjElzrNpei9j6Y/lO5nkoLuX8kUK7Tlx
	d3SjzT5Iz+3JBWK7h1WWZmp5LCZhH1dr2wcdF9d6qYT6HvWtZz58gCVkJYkNEBasmO8F9mMFGzi
	RZjbeo2TJmPvz7DHEd39I83Eq6u0ysfJGa2Nz4w4btYXwFncjrWBdXHX9HxY4EBBF
X-Gm-Gg: AYBFou2Y5rj1vK0mny8zyqXtEyA3HY2WEaoB7xdpelqFuE+hQPrsKkFNUsPP3hxaU6x
	EBuEsBekGGnyTzYmQuGDBNbyCep/RrGuTuCSyoNpZREvbMIkvRPGT1al7Hv62WE8eJ2Y7NnZ4mX
	0ucQGKVeqjCh/WEqD7QGIMFrO2NhNIAXJ/UWFAhlSb/ATXJckn6Y5AvaI7nOL4eIQ5nFEbvn+Mg
	bygp7xTAF1J+tT2dnJooAtFl3n7VztC0/9tephS55iHEjFuKqOxYK5V8eB7uFnlOodAR5FYeRoN
	/aG2j2y1vQ4Dz3YBZFmsrgOO1klua1V0YCEWPTHGv2eJX1ZJbcOBf8XEkZ3ZRqC7WC6nmmEeEYM
	xCMXqVtYuTrnwyFs=
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr209145885a.9.1789371847247;
        Mon, 14 Sep 2026 00:44:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr209142785a.9.1789371846698;
        Mon, 14 Sep 2026 00:44:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm24005162f8f.26.2026.09.14.00.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:44:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:44:03 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 30/31] arm64: dts: qcom: sc7180: Add domain idle state
 names
Message-ID: <skntn7i6iecjzufijj25zvalg2xcaxwqa5aresahychjhrlt5q@ginodspziu73>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7a5c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vcbzlnmTEU6bHl82Q18wcnLMz2V6D9NF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX64m5Ar8g3Fo+
 Eory+AZMbyIPFDpg02KQsM/uU+pozJe1n7YeyZygO9TdT7077NBuIGcPxNwtzHGT21fde+JqGrN
 Aw1g+HQrZk+X3ISJAgHVvh/H3wvKtqk=
X-Proofpoint-GUID: vcbzlnmTEU6bHl82Q18wcnLMz2V6D9NF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX1tcCJfIGlbbi
 kC44wqsIjNJ8E0VqY+xC4yC+cLXMtKEh7vYtLwSSYDdQykQZqw3vcJaJ5ejwJ7IYZQXHD2qwmdB
 MLV3TXxC15qkXq9FU0rLRz17F+PdO0LfJoCuvh3N0UXKO/+3xM4w0/MF4YohiPUWAr3ZZgak2nP
 kH7fvFKMpRL0VEPnOf/l6GytsmsMuPxifbXLCKUAE5tDhGZS41hZUX316FAwmpxU21ldFLsrSeD
 ro4fbtwv3PLFvluOh2AfZ+xCTNbcbtuMSluWOIiqQClimTNVap2tZK2ey5xxbau7gSHWrYQQDXC
 E713U/S5I2KvWlkayEoh5BmD5Q/AlB+ydvdjspLXoYAsmBp8yPOmpo1OTmkZuLQsAyYTFzK6jq5
 55OvllZqX7mNBoh6h/LQpUeHeTyEPmQHOaY8PPhRqCMN7TmTopyta72pYpzxxeTD8XRPBnzffUa
 4Te7N3QTpr68uFJpg0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109

On 26-09-14 12:30:02, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
