Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0DB314B63
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371481; cv=none; b=Ym8arDdD5vhjrjixdmX4iN/tkYdYSEnRKmUuACofSDJQ4+cjW9sDhBJvY0eGUEbl7x4ZPgPzh0fxWK0eMXPsTV5FOpk2xtz6Mfc4sGyMNXdr5fecrU1EjS5Qd88ZPlsUadRmKCcPAmg1hPD6XVlFXKjYHRqnjZuLHP6me4V+lVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371481; c=relaxed/simple;
	bh=VhdJ3FXQR0y5DJyI4SL+Ih7icrcoQxHJ/kzzkLxnlLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHET8hi7KAuKiG4V55WM2K5ZHRMqWxUglwOq5gEoiN+hmHwNIX5PhiBJzApDPbic4SsVYehOSibJjEnBqOpqCWuXUkb/5GbjjWCIH/wTpN8clmCEQ4V78yGabrw6Wf+1l5lBoYF+IeWxx4ElyBRRjzjRxNzIZAZzPzrqxLdj2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBrEZ61p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgFMmHJk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBrEZ61p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgFMmHJk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jHqc064030
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5KIevTjOfsqOCqIPoEvjHmiy
	dQ33KNJEBlJ4PdqeHCk=; b=NBrEZ61pJPE5vnlHjKse+4wiSAQcL6ThG3Bn/Sof
	btvSE/v9yryCIU7JKMgPcci3ixFBIYQKXpB5LTz3PRf074ryn6b6pwUFTc/FFaEu
	g5RUwmfl96k1IqPOwTPWqFLSmwkLMCap0eeE4p7QQfpjW/NtpI9/Ebb94cSP+dGM
	VeHNVyH/lVbKdwd7p+/5hpVpm9zgH9OGv9B2tyfM7AM0CcEYjdDwcGAXAykbn6WO
	a4OFcTTZ97FFMLKWmMvZ848wfOBJimz7shGlLCIXOQcbxZZL5QuPtCcd+ucWgHwI
	8uz/mHYgajKJr8Ao4Q6QEUuxCd4lVH8eyJs1b8VcP5Pkxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:37:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so64535216d6.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371476; x=1789976276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KIevTjOfsqOCqIPoEvjHmiydQ33KNJEBlJ4PdqeHCk=;
        b=NgFMmHJkMWG2QnUaNj622gnql72dChb8J27Ab/0LBPcGuiDCaXOw23GchfJk6+Lr0s
         8PuyvSx7WNFkzQ4cGpM/OYwPirQvs8+f7UtAPfrmfKja+DrWCxVoMk0dG9I2/uGYG42T
         ydi2Bb0GQ+O5QhtURhCZuL/Ry+AhK3LkfWjdSaZVDmoSu5wTPNHzIxF7/ZEV3l/83FTD
         epAX1F1Y1iMKa7W4ggBvKchU58Gtwxp8sEYUTRn6jllz+x6KcuKlVOvRF72D+rGWM13A
         kFObZJHmBu11oiPNW9DTTGQryP+UYT8v7pN9ZTRMDgrDyDBJTErUWB0L3g0Edj0qkg9C
         ZK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371476; x=1789976276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KIevTjOfsqOCqIPoEvjHmiydQ33KNJEBlJ4PdqeHCk=;
        b=KTXWGsFt+N6oJGhTEQAsgGglmidYqFcfFCGy/DzjbUJc+TBPwtaNl406EvbgjooN9C
         sWiZLFIJK///xUc2EVRagLW4nQYfdl1rEaaYJvc7ApvUYRnFpko3g4dYwv2iUak1wDBq
         aTM7gqjbdambqjii/sg+XxlS0H4bkkf1pXDv2ebAE9NZLzcQzMxPhbZoameTj1RPtXGP
         E25539WmlevP6mQ+ZqudcXy9oVKKMZywgAITST4dt5AuUBrDYS0XlHVtZJqIO7Gkdu5g
         Fv4gZa1l4HeLNZUWFsL7r/csCOp/IiAZ7Uz1USQqpMJ1u4edq7PTMk8Z8xchOsP/1+pv
         LOag==
X-Forwarded-Encrypted: i=1; AKwUvByMt0PZIFstjCOvgc/dxofAnyiHI7IoDuo5d0JZf/MzWe6IezJ2NXzssHDowp7f5gUZzjB0dAbIY9ww@vger.kernel.org
X-Gm-Message-State: AFuF++kzkG8zQEJ3owZI4uc1l0X2JJSltomrwhAeuEqxrTwgaG8DqgYA
	nzU6MajslxTxNaNo60HG08LZKLQWlIVi8tdfx16wLEv4KAPNCS2aU8CtSVIBh1+6i7JrG53SRQp
	E82VCwqqPvThYlwUuzmQRqgDuia6ArYcOzFSRUKVn3pz2QnA6H0KMwf/9cboMkWla
X-Gm-Gg: AYBFou2+avz0bz+iMI/SFryRghkPwjhW8SCYp2j0GC0yA1q6Oi9cH2kCTqvwB0HJM2/
	SobFnJZF22b0M0kDQDaogcMyqeeH3d3Z6KW6US+iy9ry+QVNab/JSrsdm9gNWs8CXPJmPRy/7kE
	WIE3U3dIsR3pu5Oiy8QbE2QCA/TwZiH/j/hbNgNJliZXRmprD20A2y/8W1nST1UI045Jjy883er
	gvFr1RSBD0VQTSc1fr3cDFbVRvV94JDt4xcg0q+QXSlctfhfooJY58S3MGyqxIYRQ9be2p8L419
	C5w3e7H2qbuFvHxwwq0lj8vbi67Sulchn9o8w/yKziaee9CmB23aKCEislFbM3OcRtByydIIM/N
	LO4nzBjyWaimn/90=
X-Received: by 2002:a05:620a:2b94:b0:939:518d:7f6e with SMTP id af79cd13be357-93a29807369mr202909285a.22.1789371475628;
        Mon, 14 Sep 2026 00:37:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:939:518d:7f6e with SMTP id af79cd13be357-93a29807369mr202885285a.22.1789371470387;
        Mon, 14 Sep 2026 00:37:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm24158035f8f.6.2026.09.14.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:37:49 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:37:47 +0300
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
Subject: Re: [PATCH 08/31] arm64: dts: qcom: sdm670: Add domain idle state
 names
Message-ID: <mpnr6xpj7t6pktelc4i4i3expfy3f5sawecdj5ff55btkvzz5w@ngum2e3x3hsl>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX0YEfy7VfaNGV
 HAcI5xSxzHxffmuyAC8q6XqyjZIyxUyI/DAHNjEiNTxLoesEUZa+4fRSjFMntICpFK4kwHrx/hR
 NT9NXHlqCkCf2tJeHpiaqe8afs+Iae5GSkmnsDkr0ctp2mhNTQHuJ3NhijQ3vQoQ76ILqfi1fFw
 kWIlGOxbtNmBqCScGj68uem3MVBTeI62JTZmBejhUMuapN/+E1MZD7cftg6uhihrw5yipcGtR1h
 0/J9OjQW1UDg5eE9SsbXI7diF1RBtTqQk3DdjoyevGIu9yv+iWALIb7gKWXXjAqUFFLEK5OxzhL
 oAammOn+XR7wLpM0tfx4ZJwJTUkLd+Xjh7OYT7k0tYVkz/qPKkJFSyQyXFuMPRAc4qeSH2MHPvA
 8xgkEtDJI/5WFIsAbGHSaHDIPj5jY2FdatwmNqcfiiAAFF/RRP/jKZdVKKPk9OqUNs4DvxYdyrK
 GbZJiuuu3j2pxyX/vpw==
X-Proofpoint-ORIG-GUID: w5u4pB9ETjuuJ702yUu6L0XDsJdcjC1J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX1zI/ZsnBrOHS
 bMCUfPfNcPlCtlB09Y/l2ZT7gec0k1OWKqXUcqFgJmZDftOeb27M0+M/3IH4B/5eUx5JfIV9rtz
 9Unr7j4VAT4/He6xn1eqC9/eE7DjUlA=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a454 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: w5u4pB9ETjuuJ702yUu6L0XDsJdcjC1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:40, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
