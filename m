Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BC64A43F2
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856617; cv=none; b=cwl9nXzKkLJJMcFlvs7vk//6elljHiqJfow4Z0lEe2UY+vpEFmq56Bx7wdsE7BKxikzRlquR7xo1NV7/mICon5Y3OS6vejy/MoGbzlNKtksZ8Na3ALRA61l+u7srV++KP/A4fefpgdcY0zIK/HMy7tmgFwq1UXgOSZQWJQ4umn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856617; c=relaxed/simple;
	bh=knciZzeylxYeaS36Mo9T8ZXpRQkf+w2/+tkxWGB8knU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eq02Bny+hVolCZCtD9pvkwHFawH1pSP85pksJFRE+0KhX+duOJFaqZ45x8qAN3LaCbEBhlWYEuDckicxWeAfY+NMQYd5vDGypXanscaERGGQmqSE5C7OXjkaueVE31RvgJqOAMLtOl2I2H9ILWB4/tgPpSFQSESxcnzAdDOcLlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3nz8CVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKXYcQ8M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3nz8CVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKXYcQ8M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LnmN1645958
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ad0bKhP+N11QtS34YNu13QejnMaDsA1lHN5IGmY+Ajg=; b=f3nz8CVqx9DdA4Nx
	hSW8/csdCpEQoc+XuupdEMfT7bwFYtwuvwDCYGJVKT3FhUbpjSMGclKjVALGoTPy
	GnTWJKClAQ0270tzB+EDNYEHzJWb++l5+EbUpMM83CDxDhqYt5mF9eGQJ3WSfvoM
	nlgQEH4SCeI+WLCI+vt588WVu+yXX/4VI5Osv3tEWxjmETewBts8H4goPbg77GDF
	ObMpCG6/xGB7nM7PHAGtgc1evI93KFRi3WsMhEYqHwMjHG37dbmGHak1Kq74CA5d
	wKLly/Id4Mb1+FGJBq5DJzqgrl+sHcSo/GwjkmOlbLcTLGemvcrPm7dULenws3Np
	t4DOPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugkcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:36:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso839064085a.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856611; x=1789461411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad0bKhP+N11QtS34YNu13QejnMaDsA1lHN5IGmY+Ajg=;
        b=RKXYcQ8MKJR5aYT01NG6YK3igJsEGP64UnTlzEt0VDxD1n43W309zChQcRRUZKBiLo
         vBccd5i5/R71/d+FyrKWfdluPe9qdwqLkv3PaOZF7kdAybVZuctxigOfgP0xPrP4rLvS
         +vntkTUPDSeAPC3io7FLmrDT73lxpG3aO0tu4rjlO67stLRHmes6fG7DP/PfSwoLW/fs
         HJpa+IR8RQaQDFASSwciVNn0m88mvkGvvEFjCrKoUQLnPfLWPTmlp/biN6GTt1g523hC
         UBuSiiTQa53tFToBX7sB2ZViYGZUrfft6fcCMuETvozDAIfNKkskbR2c5LmhdWUsVjJU
         Egvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856611; x=1789461411;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad0bKhP+N11QtS34YNu13QejnMaDsA1lHN5IGmY+Ajg=;
        b=nwYF/S3n4GDX7C3SKFULr7/vuNaj+AEBHCdyohLfTv42wbm3NI0v3mo2ts6ZcXfbmL
         uaLWVbev5ALKEY4kRDVxmb8GAWuas6tDz5khAjTVM+D0JMDgpb/AxxRv/OC2kC1irGuH
         8+Kt20O7N+mF5yrXU5jUjfTUtj0SGhjn3YiZFNlGGQlmmt70FFWhk2s+QFyZD6yETVdq
         9+m28hnByOi4sXFq13VFk1ifR/Z1fzyurPqVI5RIeqkWDORAHQqFmjHhA618Y/Hw4fp9
         HFY7p6tFP5SxY1n5rgzWDllWcZkYgfhpLB9/7twPpfjYNFNP0r/LVFHWS9KMJw2Y1wxn
         PjxA==
X-Forwarded-Encrypted: i=1; AKwUvBzivONh/ccIuGD83uBnnNLjrZ6vcaW1ojNO3qDIVsgEaZhHi7uods4wiK/jqjPoXM1okW8uNWFt8lHp@vger.kernel.org
X-Gm-Message-State: AFuF++m0EPi07wa1QHeNsJvpo0ELIl2MdFLGmqOUcCedk9qErhUhSQLY
	oK+zzMYNYFnfqllu0a97s+zSmXDXylvDy5yJS6umZofjqJeTsDUwwwAM7xe5DoA/dT1Uqc046zm
	XnHnJoJBBoPw6euWoxqoPhqnMrpJ2pxHMrl4ouV+HZ6/cVfrIYD3CrHAltjg7aW4n
X-Gm-Gg: AYBFou368iiE+IzotYtVHm7QdyEoglOIDu22OcU/pOaOjhRMH4yKexfqWhlu8Abg4Kg
	0ozx7hIjtyo6Q/ChIteWjCzLsxIFlCBOTYx4wZVRZwNdxF6iDc5oIbtfFsjmbq36zzzRZTuDg5b
	4zFhzs4KohyIIzuk/4G+C3nThnntG+YAfwwIKTq2O4Wsppw9V2dOTUiVDzGmqWNyZaKc90BeePu
	3i+WZsxh7xlHnlRIth+HIvY/nZ6m+BjAOXKzocow7gaSM5+1It/xj2owKHdogdMhVCLhz/o7hpU
	JmOY1DPTlLr4NrpRtzcg+eRxaAWxiO3Zf+gVu9ZqTtABlVcYTknJdyrUX75PF6CoxXWEiKP4IDq
	fd9hemUfqQQNLlGkMxPF1G9PErYhn
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr763283885a.44.1788856611394;
        Tue, 08 Sep 2026 01:36:51 -0700 (PDT)
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr763280285a.44.1788856610853;
        Tue, 08 Sep 2026 01:36:50 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm325117055e9.3.2026.09.08.01.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:36:49 -0700 (PDT)
Message-ID: <f16a09b6-9ae9-4a3a-ac31-48182bf8a179@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:36:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
 <20260908072335.611331F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908072335.611331F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fc924 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=N0GlATqSIOfpj-D0eqQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6YFD137JUDJ0B7IHDzvVu9Pmj0wQAMyp
X-Proofpoint-ORIG-GUID: 6YFD137JUDJ0B7IHDzvVu9Pmj0wQAMyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX6a0lzPWDTTqy
 chiD60YnA8oNdtTDFS/JIlP37y+UhIrNw6MopqSSXKPNRighN/8v0mH25Ol9hAA/N9jvS7MPbPm
 hewJkilKvoajpVIArABeir5WJzOjDB25ytE9oUivZMBGqAalttpGNvu6z71HVDm9pJ0VWBx48t4
 57PiKR8XHC3eKnJH8QoDtlbC7T1QwX23CwJ3UtjRONcwqxeSkuy0P+tgpuSD5piD/rDEdDbbgfA
 Yhuypfi4hdYGLJKLBzbGr4dCtXUNG8aybUUQs9xxhsbkHcRDzVvF4YXR6jASbzEm5h8rC64CaXy
 1YRey34V6U+jP7/6JRJMYcezZO+Xsoqp6+Fij6XsLcN+lO82TJUVzXHjSf+hyZPJgKj7Q/Av3vu
 QNKTM42d0IUfHVbdAIoCQLPkvN+dlNqSnt+rzYEPvPj2WulUw0C2eAxCOIuSY4nqcIXDVJla2F1
 0A4jeHiXnkBCQE5qmWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfXzpjKJjQHJXTV
 RtQuG5lnMEVsn5GdaKjfp818z0YXrrXe65OXmDXqDEsVlXUP217KqNRHcScgM615OR1yFcfPSm6
 nJ4YqUlFHIVlbK+oDMb88bKwDjT0TFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] ALSA audio callbacks execute locklessly and can run concurrently with the DRM modeset disable sequence or when the display is fully powered off, leading to unclocked MMIO access exceptions (kernel panics) and register corruption.
> --
> 

Not fixing this.

Best regards,
Krzysztof
