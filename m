Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946F441033
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979318; cv=none; b=IU+vBoc3I/vsA2Fund/dASlAV89N3UdNFrY04ycHzLTcwF4aDiM3p6Y+o/nq/3KoRZEnUq6BfpCbw9v8Ba5YQzev96EuK270fUtGic3kDhTyQmO0yuMyod+2+5ue3JvInc/EVKcxRd9S/35YTEo6xXJjQ103mGFM73mms2CnN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979318; c=relaxed/simple;
	bh=yInp3jQ2nfEc1FkUQ7qUyW0p89IAt5AFdaupsLTGINE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=q55LG4BWah+TguDGCWS37mPwe7fVgznuTlw2WDyjVZLLIoHhOpr9DxPnDQErkv+9+c5XxUC9Tcwtk0go1pTfzBn/o7DnFZ0WTTtBtK5/Bm/PfsGCDDmWg8DZg19kde4NBe3KJSho0OLN12cjI6iwLjsxmGQe77+Ci8oXl1+4clA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgBJukjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWlqPLNJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgBJukjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWlqPLNJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdbhr2814389
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tkluilWSFi/zwAvCgNgh5sc8znVExg6yAujw+zfcHE=; b=IgBJukjVHVlVxAeC
	uka8zQLMz3Hpa6J1fgfMtCBZI89mTZ68ZtodlMEERZAKZUcKVnWH2l//Tha7AD1f
	WJiujnb3gxO/PKyKDmp9G/vPf5MR5sA9PDr1GksgOsatL2SsqGph9AArDf6S8z8/
	3LhvgwRX/pBIY9Gef6MJTWA8nwyImw6Wy+Cl8dhw5lLukZhh0KKPCWQgYtFC53bv
	MESSzTiyrq/ozH2s9JhocgnIsND7Lsq38ZOvTw4BgrCOb+iHWVpOic3FVqhhpmSF
	sUnufd0QpedVrTnqkCXm7EzO8vDAMTO7aJOwphbYyvy+uqWOaAZ9MrSAlyztHnLn
	oVnf1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86ntbn95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:48:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so5135071cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979315; x=1775584115; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tkluilWSFi/zwAvCgNgh5sc8znVExg6yAujw+zfcHE=;
        b=HWlqPLNJExBxiZ28bo2fvjBfnNBzpans7/7+9Q9Abv7LC3Ah4k/fMn6dfxE7f+HHbL
         Md8S7D2G+A44PaxSW6I6smragVL7kiElff2c0AWfeDWhXT4P92D9uY6T81r7E25p5w9A
         eNfWgbRHdb1w0NiemmPoXgbq5Lv44uQ9rlidlXYHYwaoE0rQ9A0Mnvmuwlxog2zOKHkM
         SpIYQGswVjBTz5uFDJKdfIF+h9PLshwJ1Qi1Rlnxc8L5PHZUZKctE9jckxYD4FW7Pz/n
         TL2A/du6VGI4DglBA9c3dkC2NMjt7ff6IX5BsYiVMWtoSF8BFUg68GLqVNxvcF8z3gzn
         90cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979315; x=1775584115;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tkluilWSFi/zwAvCgNgh5sc8znVExg6yAujw+zfcHE=;
        b=qx2nxQq7dLz8oTS5todEqsHMY7Ck3rzH3+CDndePRQJHMAk3J5Xr6Kfn6YNd8sLEmV
         Usg907niSjNOyRYR9IZDLBZND0nV3c1Fm7eqb+ZoWDx4NMzq9ZO6mrNY/irhPomVnyqk
         SbPdZAJN9l8zioh/Ejm/CXOEjfwUuJOcdssR0I5J7blZy0naxF1KWOSF04RTLbsLZzRi
         CRORQMqwn9XFxX/s4QyZdNYmIAKjp6zM8BUI1fS8bAyYXnToLnqU/lY4l4V8DIDFYEti
         dW+F8hNvH8VWBIb0p0RaR1CX6/X18vWz91H/7cs1viVDUPd36//sd0qp40r9IaE/Zv+e
         qDJw==
X-Forwarded-Encrypted: i=1; AJvYcCULHmIa4KkDIg5C+K79heOqagfLKnRieYWJmfTax26jZrLRDUGxyJdBxcAIwpr9FS0YrYQTJDNgWIo5@vger.kernel.org
X-Gm-Message-State: AOJu0YzYEXVXemhJpwkhbEW4EgPZvU1gZnTuZlTXXhuNIN9fPCRVyBlI
	nhpWqUtnAW3Zk+34UrVtv40vIHM8RYN9GSkKaNR9N7EOeUrPLDMhJggCbJzyhzGGJkA2xe6UQyb
	yJtxfJLh/778VSsfmcodhtdVVsky5Bx/0tV8RaNoGS3gPFCSoCo58fzeRveJ01AwJ
X-Gm-Gg: ATEYQzzTPoXesyGSaoeqUJUutWibOoEP0A0HZVjuueav4GVBCIlo4o5Yt8r1Imp3oJL
	VK1yco47/YhRtpC8kMkpp27kV0OVTkwH1n2zCXOUGCoSE4aeumUn1fDwqHJbfy4/9JDF5aIgYRB
	Zcwn26X/LAcNETVMaCCoYt+5TfKcylt1rd/Ij9hZYJFQdYkMXJCDsuFg0ZIs60GgCOwrjzbHhoY
	w2IXnS5102CKZz1zsT2dOI+e/PmPo9zK8oZ3zmUddemFOe50m448VPX8NsBw68XLgpA+UC/aIFO
	wPTOrNuMb7evZlxztldMaIDw3qcEcsYkwsREqbizUH3knhaW6oC26W/xT5Z72tkDKdM3Y+nlsJy
	pENixJcHSsAIO3wKbj95NGaY3D/7D5yGWQhzMrGjb9pYMU4JFIcJq1Kck3qlg
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr43353471cf.3.1774979314925;
        Tue, 31 Mar 2026 10:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr43350401cf.3.1774979309635;
        Tue, 31 Mar 2026 10:48:29 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c091331e0sm50383566b.8.2026.03.31.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 19:48:27 +0200
Message-Id: <DHH5NGQGQYBE.31X8OI8AKTYRU@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 08/17] RISC-V: QoS: add resctrl interface for
 CBQRI controllers
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, <linux-acpi@vger.kernel.org>,
        <acpica-devel@lists.linux.dev>, <devicetree@vger.kernel.org>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Drew Fustini" <fustini@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Adrien Ricciardi" <aricciardi@baylibre.com>,
        "Nicolas Pitre" <npitre@baylibre.com>,
        =?utf-8?q?Kornel_Dul=C4=99ba?=
 <mindal@semihalf.com>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Atish Kumar
 Patra" <atishp@rivosinc.com>,
        "Vasudevan Srinivasan" <vasu@rivosinc.com>,
        "Ved Shanbhogue" <ved@rivosinc.com>,
        "yunhui cui"
 <cuiyunhui@bytedance.com>,
        "Chen Pei" <cp0613@linux.alibaba.com>,
        "Liu
 Zhiwei" <zhiwei_liu@linux.alibaba.com>,
        "Weiwei Li" <liwei1518@gmail.com>, <guo.wenjia23@zte.com.cn>,
        <liu.qingtao2@zte.com.cn>,
        "Reinette Chatre"
 <reinette.chatre@intel.com>,
        "Tony Luck" <tony.luck@intel.com>, "Babu
 Moger" <babu.moger@amd.com>,
        "Peter Newman" <peternewman@google.com>,
        "Fenghua Yu" <fenghua.yu@intel.com>,
        "James Morse" <james.morse@arm.com>, "Ben Horgan" <ben.horgan@arm.com>,
        "Dave Martin" <Dave.Martin@arm.com>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <x86@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        "Len Brown" <lenb@kernel.org>,
        "Robert Moore"
 <robert.moore@intel.com>,
        "Sunil V L" <sunilvl@ventanamicro.com>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
X-Proofpoint-GUID: vJeHXSFXPzDQU-4V1J4DR7VWglpx9uUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OSBTYWx0ZWRfX9m4wQkvGy8o5
 oRiyEJkl/dhDFVn6Zp+ROhAwQva2JkGeuZ+WBY0n8FmzU1wKxQlorwjjKCzb+SRcjQbx5lg5/pe
 WGzyXQxAbMukOCvW21tJ2Z3uJYdDNyN04m9792jS0YcVXQX9M30DEhjwstGuhCZCfvNzopH9K2w
 IpiDukCsO8ErExda07s9Q+oVM5830Aqoc1naRvZieLUslOjD87tQ388IbYQVwPPO7i53x3skUAn
 Rx38OL6uCrAoVMPf8jDEmR78cayO895D3FPWgeYD856BPn9EVSLnr6JPuOWEJ9uaJrJbF3b41RQ
 X2aZgmGFrDaQc8caHvuSEWjC1pcfx1MJjeFEA1D0hNSVYRWfijBPACW34WM/5RgruGeVOYJDM+A
 pjlxDyoIMr17GLU0bKLakmfriPRB3MxkpG/YMFL3fyq3yDJDfzs8Q3Jn3BWZ2hNA2nn60W6Sz0Q
 ky14zsPw/Zs67O7Znrw==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cc08f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=1RoDV13bKi5nvpdD3ZQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: vJeHXSFXPzDQU-4V1J4DR7VWglpx9uUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310169

2026-01-28T12:27:29-08:00, Drew Fustini <fustini@kernel.org>:
> Add interface for CBQRI controller drivers to make use of the resctrl
> filesystem.
>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---

Hi Drew, I have just a few minor comments as I noticed that you plan to
send a new version soon, so I'll try for a review then...

> diff --git a/arch/riscv/kernel/qos/qos_resctrl.c b/arch/riscv/kernel/qos/=
qos_resctrl.c
> +static int cbqri_probe_controller(struct cbqri_controller_info *ctrl_inf=
o,
> +				  struct cbqri_controller *ctrl)
> +{
> +	int err =3D 0, status;
> +	u64 reg;
[...]
> +	ctrl->base =3D ioremap(ctrl_info->addr, ctrl_info->size);
> +	if (!ctrl->base) {
> +		pr_warn("%s(): goto err_release_mem_region", __func__);

Missing "err =3D -E...".

> +		goto err_release_mem_region;
> +	}
[...]
> +		ctrl->ver_minor =3D reg & CBQRI_CC_CAPABILITIES_VER_MINOR_MASK;
> +		ctrl->ver_major =3D reg & CBQRI_CC_CAPABILITIES_VER_MAJOR_MASK;

Major version is shifted.

> +
> +		ctrl->cc.supports_alloc_op_flush_rcid =3D (reg >> CBQRI_CC_CAPABILITIE=
S_FRCID_SHIFT)
> +			& CBQRI_CC_CAPABILITIES_FRCID_MASK;

FIELD_GET() could be used to make the mask+shift pattern nicer when
defined by GENMASK().

Thanks.
