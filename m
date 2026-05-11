Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF51E492D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497084; cv=none; b=fQHDNaj9ZqioCJQc7elu+00JZwrD0q9AXCTQvZSi7E/9DgrHfj0EXLeBNIsBjWo+n/B9O7Tr+51Al8QgWCI9kEGD554+irzCwMm4YbcImDYyt5AaHT8FetcIbawuEBZ9GQXS9wIl0uUJSECQcrBazzoIREcB/G12GGV5G95CZYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497084; c=relaxed/simple;
	bh=idKSf0Y7Y4AVRyohvvU0Gin/2AbcPVLAoJEq2SUw1/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyIl+PwahO/jANLy3PsVHUkWzj6CiU9NW1G6S696tCozNz21SUfEgLOa/Fm0AOgGAxJVtbwjpJgJOKRENI1atlfgfVopecT0mRb1gpmUtc/jtdAp644nTVQJkKIgrwBtqcDgR5A2lVxsV/CkAcFaAa3ixninPvpIFzDudhiCXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiLl/7Yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrAl3xGW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiLl/7Yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrAl3xGW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BAUJ5n1421182
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=; b=PiLl/7Yi0R5gn+5i
	2hy68OfuaYkmHFrpTXSLhlDK+zk83/rRnwe64goU5qbMKvyG0CGjcN9ZvR1aFrA5
	QaX3qj18MpL6FvKb5Q4CS7mqsTLplElGPCax/l3UiXlGs5DV8VFFYDfcddEmWbRh
	5rA4NsRlbho4KGtmjLKn43mY0xHc6EVc7CwAYqEKgCegDzfaOrqJoezjKi/mhF07
	4sbepO1VFPQeY0uiTjtKPw3WIjq3ztMy9L+bLMbIods1sbK1MAtAYnC8yPLHqI4V
	ezyeqDymdwpAVbHV4MqYHncdpVNGAR35lG41AczSE6dxMolj4CTk9QHL3F9NgPuW
	b3WDcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79njtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:58:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca172588cso91369116d6.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497080; x=1779101880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=;
        b=XrAl3xGW6tMDdzya8MoqXMToh+ZDf5S3scEf7W9ZniEsi2knEay/0m/zgeY0uzVrcx
         t8+QDRFEKzLiajlppy1AZfZ4xsC/2ZmYXZGuslp+Z4k3y9FRe4ObXvts7nE4nUYDAExW
         8qHcQmAmqsDWJPCvHca4B5QBO/EVmobN1jpVZ+duoSqL2aH9IHREq+sNKIOH2jNnugLt
         kEGKDH8Jnwfl0AJtpF4ou9PE3i6+BcK3DQJbqKc3hePgSSIS+VdXIZRiJiyHu7YTdsId
         loeoxFPzwpvAWAb1kqyxBPrRkA2iarY935u5xB1O278oergY0ykKeNMPm+BSL+HXzSZu
         lo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497080; x=1779101880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=;
        b=d7DmCGiVkvJcFP0nqc76yuED513OeUwN9aQ51qyZn8VEbCquFQ30cys8+PCYXZERjq
         O5mzFs+PYgQZFLn+mo8AF5IylTxXgBsyOv+CMHisDoVzfRT4soN4/Cajxc0lKOAIvVxT
         WUQn91tjquCu2Sd8pEC3BbEGlcDOWiTeCGJOlrxzChlXgsKcO/+dYAYuHGGB/WXMfYH9
         2ET6aFiuuRKtlgEYVkdjhD4ncpB4LOK0FaGEfudhuxtWWxU3jFiCI5et03Nc1o+HEPBp
         ELsoYh0i7KRyVMjKzFgkekz9C8/oRGNsYk8CklWJb738Kc8raBwwvOMq0AaxyUfmPOrV
         zogA==
X-Forwarded-Encrypted: i=1; AFNElJ9tj1zZV7Y0kgzpXds/jw2fDhEMPYN783aj1Ng/mYmNV6BnDVI465KyRC5K9DasNbGCFA2ndpfdCx8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FgBAD7uJzFsr5nO7x8nTgR9HvIqovGGqtuQmS8j2tPoIzlBn
	jGY+dAQseWVwQcGywpeC5K7rW/hGpuOWqiVS3Jea8gcPSS0kmtc8Ux6n30jGDS43I4W0L1XsKfM
	ySe9WTF5tWXe37b5KLSlpWU7acaSPG2isRWf1f11VktzFJVor76DODZAVt225TBsF
X-Gm-Gg: Acq92OGXiQ3qLKeB53hhIByyoNCix4GtvN60cDJT9B9GqzJLm6uEsy8ck1OEeTuJfn8
	9m5D+m9ynJ51bU35HgZKhceC2rOxrr6QnvYNCHiD42GOo3U05PkL3tVRH+rauxOWXnmmfvAdov+
	85JlSwxBLaKJW1i/Jhq+Usc5d5huLyjc8UVGePsTtDcrmV8Q/jh1GoUgEjWQ8v+x8Cfz2kwIl02
	xPhsyPI2eB/L7W/f9bAgdBGWaN7czKNudAjj9lcne4+l8zrKGk5xtztHSTV7WlACuwtx1NLHtZX
	VstRCKR6sZRRssu8AhZu5AcB1a70scfSNnvLspsXdKqbFqt3S4npvXTKwSqHEWBfSXkGPFNlGnT
	9uMflJNtnRMHY2EH5hTmLwpihYV5Vw45oggI41FwUbDEJ8+JKng==
X-Received: by 2002:ac8:5a85:0:b0:50b:526c:541c with SMTP id d75a77b69052e-51461fb1c27mr339570461cf.50.1778497080353;
        Mon, 11 May 2026 03:58:00 -0700 (PDT)
X-Received: by 2002:ac8:5a85:0:b0:50b:526c:541c with SMTP id d75a77b69052e-51461fb1c27mr339570131cf.50.1778497079931;
        Mon, 11 May 2026 03:57:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fffb9bdsm166087555e9.1.2026.05.11.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: (subset) [PATCH v10 0/2] PCI: Add support for PCIe WAKE# interrupt
Date: Mon, 11 May 2026 12:57:56 +0200
Message-ID: <177849707405.46496.8165024025113766918.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FbceGi8mlJ_m50ivPvHhJ-GwNJv3WXSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfX13GLCiGlJQyS
 0EkzmoP8dy7sgsGITlKdlG+POhOkqV+G3UH9BcZSoFRSKFv+DvuXR9v/HlIrs8YMiuAwoTDZIpf
 su5B9voWurNs4pEonrQ/6Fa3PKELaEGAFwUJUMRKeJreJkSp8R8yaEJ0Gzt5Da52RY4vHfWt8d1
 5t3mwh5inoHpdDZoK4CnxV9nID7oXRXOKMhiXhS07wtpgjyaahHksIX7O8jG6LVNlBDoibWHH6Y
 PHXwCcEPKLiUyDNh/dfzt/hFH5EW2ytC54s3tH+HxgFWuWlqqUNCqHsfrTVP5a296z+SbVcZ774
 IZACA9tYeNowrdzZuaXWztr2U2ULPNhcC7G+eBhSzWjSQ8ERjjPErs9aMj3MMpgrxLOu31gEi95
 779gYkNWMLWgLjUqH9vfhAvjUdo25njqAQb1Tcj5SgD7QK8oymJ7L3uBcHPKED8z6SMV6ZCECn2
 mol9ViuBhLWi1vpsjtQ==
X-Proofpoint-GUID: FbceGi8mlJ_m50ivPvHhJ-GwNJv3WXSG
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01b639 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TmBss_aizDygq35vy4EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121


On Mon, 11 May 2026 12:55:36 +0530, Krishna Chaitanya Chundru wrote:
> PCIe WAKE# interrupt is needed for bringing back PCIe device state from
> D3cold to D0.
> 
> This is pending from long time, there was two attempts done previously to
> add WAKE# support[1], [2]. Those series tried to add support for legacy
> interrupts along with WAKE#. Legacy interrupts are already available in
> the latest kernel and we can ignore them. For the wake IRQ the series is
> trying to use interrupts property define in the device tree.
> 
> [...]

Applied, thanks!

[1/2] gpio: Add fwnode_gpiod_get() helper
      https://git.kernel.org/brgl/c/8a46bd2638f1ad6d1ed73dc3ab10919e67274738

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
