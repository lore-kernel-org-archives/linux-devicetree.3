Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500097;
	b=hXseL3xL2WMWjLlxnAIGhlPF+HfGIfFkV0wSUmrLfHj6OyIgDcoKUO89zdqOTIVvwj5b
	 QqSqWWdpgQDDrKtxRoOQn+3/E8tSPbJs7+4MyFuj2bxTJEBpyTupPpI7QVLtqsDiIkRU4
	 H8B4ypNCDaUaA0TL1yZrQYyiwlKXz5UZIxBjEjSQFgaTo7HjrzCwqk0k9iVfX0axMNIm6
	 5lBUdd2LmoD83BiNSI87prd8aHkrZ9q4qBj88mXfgx9yNhRpuLaY8kE6fKN2lkdRgLPsj
	 ZFe03S4/dKCsR0yG35H42c8CM3h8lctcryT3wCPnCRfMA77JswEkDwPSQ8YFDC6qjXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:Subject:Cc:To:References:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=;
	b=ZkdXbqFZ5RrUK8u37Ii0OCeVebQbRxX/VsMev+WsfsaB16E9+xSyPC6wztDnPw1vB5qQ
	 FPHCd7eb6WGRMYevg1plwmOhAqdLuc91WYLi9UPa43Stng5NWefwhiT6CGZ/aJdoJZWw0
	 I9BBbo7t/9QNzt1Ua4wf/wLMrytOeL8AzNdy3NNXBMVy299MXVKA2d7KCoC10jseEIxm+
	 aGwwiuh780Eoa6lX7cI1FpgltmAmAsD9WlZXIe8f8tSKFBZ+HQWMY0Y6pevRrHl+nwQN8
	 c2BJ+Xk/UgwlrCgJpXafuPS2t4zoSACYTA0ppITk0SGqPGcWF5+KquE4gJwwpTa8/hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMK6QB0C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MwZumgfo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C73606A33A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C73606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMK6QB0C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MwZumgfo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZkgm3181017
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=; b=KMK6QB0C53FsJS4C
	tFzPmI8KYZXPG9YLJzFIHsq2h7uTULHaITsbeYFUIXrtAyTo9VDxZNrFSqDkzJpq
	mC8m8R/fymWFTkZR+zYJufGcFbmWp/MxWX76MlvAFLbG9FoP2f+z+rKCIxe+RYZp
	fNg29Szh9iFitCyIbL9cy/C2Vl7m85c3g6TI51EIbHfLC9h8O0jJ6fgHrtpY4rGL
	08kayBMDGukcYg/QNo/plpZ072zNL/DySCmPjrKsTCznHdBeN8UXVE0looqITHXV
	CSjb2q9owW+uO5CsIU7QdGzYYy2A7CSYd9P6FRWnSeZKPdrXY2GcO5p65ofbSXCx
	kI4SBw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j161w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:14:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso828785137.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500095; x=1795104895; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=;
        b=MwZumgfoEOm5d26AKGeVF65ngzTwLKH5CVc8lCagWrkvFp+Laj1xFDiVulfoZ6aP6M
         2bMP/gM3aFt/xrqyyrxmIaPowRezw+WFEg1Xj2rAtLAT5oYWhShXy01Hy4Q0hO57amq1
         9Pm/1P1gME8FlVN3D0CwElj/dFC4Ts8OeSginsjNlPOm6dBJXBpM9PkQqQF0KPw+y2u0
         tMnVJTK92rVjYrvtz8+6yrT9ErXXNdjiiPO2zOQx1dcqTeUvuE7CbXdbzir8PC82RRLM
         w6zLnI0Ryk3lRoUKHTh38BdOX+GyjqUg4wAaUbMMyYc8XLQiXkM6jO+CbLw54WRyBkD4
         gIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500095; x=1795104895;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=;
        b=ETQvtBNVXZai7ckUQkVOOjbJhBgbpF+MScMgUjmduRZkxA4nZiVQES8xEFz85WytdL
         rfBa0SRs+ZLPfV5NT3HZy3UW8ybpwnT4mZPjGTrPQ1YEVn4oFgOceKhO7GWcg73CBTN8
         yanhfdxrVBnvrlI37nL84Ce403prwQsNb62wB0+Uf5YG1/xoUNQNM080b1ZlPBZzi/Zb
         GBiZlsj0cj3gpC916NnJ1Oswopb7SXISRc3sSn+KfIiyocStKRHn7q+kkY2nk+nNfYu+
         3kdZ9oPm1e83jAkXS22Bc9Yf+ppZzPk+EQ34soLVtXHROxfGXb2w5fg41qWn6JMlKsY4
         pmxA==
X-Forwarded-Encrypted: i=1; AL+hErHKVbsSmc8FPQaoN3uGJAMglet4aFdvBqbXKOxmO63NBdojkmSGfiPnEt+0gZb8IgANQFm/M0c72f9f@vger.kernel.org
X-Gm-Message-State: APuU4Z/bvQAymEH3+RNo7S+jOviHerE74zTpqtxzotaaL7Gf8HhjBpHs
	Ok0twMosD0yyw1TI61gfhq5S7etWitSxAQ3I3JKIAd5m9YxLY3bp5Gmk73KNc4D/XgS+x0Qumih
	/ueVDv1eux9q13x0AJlnmmCQkZf3ZmIZKgPrRpRzqBAycmBRCJUJ9/OTtee2NgY0u
X-Gm-Gg: AYBFou3vnk2wEPljmyd8gBFcrbpYI9XHxOKr47dZ6ngr8SfE827njzLLd1ebszP5RU4
	f6lLABgkAxyEmtoOa+3/vuO+fHPBOAP3hVZY0q4aOpnBAoDSvNjBMfaqpWaIDdnu4AFIsvr0Qpz
	6YqlGgqqwQ1tKXNNygLk3aTU8d+wK0Yz/lQFnWgQpkKCWnwny6HdU5dBm7+EqpVjQXAI5gqjPGd
	c+f8QBGtNo8tyUi2yJCXCtzuIiUVuzdW361gfIwuDHIPsceqfuGYSA9srPSYjrec+b/T5ZbMtSn
	V7ytW6YGOkUJhtQyzw3CQE51WV3JYNdINKiFhRVBpqJm9CiY9yq++EvJi9TDQi6hjT9ZmqrHr7G
	akmsa6VDppsf1J5G8+v14QTamF/sx2SoCXsboOFDXaieTPJe6LEdMo3SWzP5d5Me55NXCjsFqQi
	P4tPqyE0PEMSo=
X-Received: by 2002:a67:e109:0:b0:7ae:c2ca:8e1 with SMTP id ada2fe7eead31-7d4fb25077cmr1920124137.11.1794500094905;
        Thu, 12 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a67:e109:0:b0:7ae:c2ca:8e1 with SMTP id ada2fe7eead31-7d4fb25077cmr1920099137.11.1794500094134;
        Thu, 12 Nov 2026 08:14:54 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm78783665e9.4.2026.11.12.08.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:14:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 17:14:50 +0100
Message-Id: <DMTD6WT2DU30.AX3QK44UUYB3@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v11 1/5] riscv_cbqri: Add capacity controller core
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
        "Jonathan Cameron"
 <jic23@kernel.org>,
        "Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>,
        "Zeng
 Heng" <zengheng@picoheart.com>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <x86@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Drew Fustini" <fustini@kernel.org>,
        "Adrien Ricciardi"
 <aricciardi@baylibre.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Albert Ou"
 <aou@eecs.berkeley.edu>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Babu
 Moger" <babu.moger@amd.com>, "Ben Horgan" <ben.horgan@arm.com>,
        "Borislav
 Petkov" <bp@alien8.de>,
        "Chen Pei" <cp0613@linux.alibaba.com>,
        "Conor
 Dooley" <conor.dooley@microchip.com>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Dave Hansen" <dave.hansen@linux.intel.com>,
        "Dave Martin"
 <Dave.Martin@arm.com>,
        "Fenghua Yu" <fenghuay@nvidia.com>,
        "Gong Shuai"
 <gong.shuai@sanechips.com.cn>,
        "Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>,
        "James Morse" <james.morse@arm.com>,
        =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>,
        "Liu Zhiwei"
 <zhiwei_liu@linux.alibaba.com>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Peter Newman" <peternewman@google.com>,
        "Reinette Chatre" <reinette.chatre@intel.com>,
        "Rob Herring"
 <robh@kernel.org>,
        "Samuel Holland" <samuel.holland@sifive.com>,
        "Sunil V
 L" <sunilvl@oss.qualcomm.com>,
        "Tony Luck" <tony.luck@intel.com>, "Weiwei
 Li" <liwei1518@gmail.com>,
        "yunhui cui" <cuiyunhui@bytedance.com>,
        "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org> <20261108-dfustini-atl-sc-cbqri-dt-v11-1-33a1bf0cf01c@kernel.org>
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-1-33a1bf0cf01c@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX2YAQKM5V0Rm3
 qxJov/kdcUL9wZ8iqcmXPsN5R/lb0uC14UraygJ2FlrnqsmKp76oOxH0Jiz52SNKuphQSECXhKt
 oGqMKK80X6Xdp+rmVNoaRZ0zIZlRzEo=
X-Proofpoint-ORIG-GUID: kacl5xl3ywDVdh_WeXdJ4qRwHwbt3PPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfXw5Y9w0JIGbzl
 doEiwQsQI0IzCNQO4IUuceO60aqo8VDNgwHKuYhNTPKiKUmOVsmNvL1500cFXcJ4LiE1av3Fl7D
 9p//gk9Arwb3KuqYUkT1bQ9MWwdIbv5bOPSoQ+Qf838+y6+d4xXCMj6Hg6uoetRBgFJX3NWtMxM
 RdjuDdxOkKqmYuBFN5cJLvDx2Hwmglcrc4H3ply3rA2f4G/Xfc5voI+25AlbI3iTFXyRE66sYYM
 zI5PjG/338uctXYhqRLgyqNhL1s9VKfcHyYjRiEyVTAgPSfijj8cUpffBUHR9H8txizJk7KoQac
 6DkkdWMXNBz0hoOonZhlUCJelT+dSudZO8Av6LSYqzmVpaINM1E0h79OuRxdWGyFheKWsOJtPzZ
 pyoxSHMdJUlJ4NBa1p6B517DwgvKViN3/qSU5DMZ5aH/LWDVH1A0T8cMHKX3mG0L3QU0mlKSP7f
 J/g5U8pHmKdDhlDP2Aw==
X-Proofpoint-GUID: kacl5xl3ywDVdh_WeXdJ4qRwHwbt3PPw
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5e5ff cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=MPNzcpqd3dBX2N5RN88A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

2026-11-08T15:20:50-08:00, Drew Fustini <fustini@kernel.org>:
> Add the core for RISC-V CBQRI capacity controllers: the register
> layout, the capability probe, and the allocation operations that
> program a capacity block mask for an RCID and read it back.
>
> A discovery layer maps the register block and describes the controller
> in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> the controller from that descriptor and adds it to the controller list,
> which stays private to the core. The core owns the controller state
> after registration, so nothing in it depends on how the controller was
> discovered. The caller keeps the register mapping alive.
>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> +static u64 cbqri_readq(void __iomem *addr)
> +{
> +	return lo_hi_readq(addr);
> +}
> +
> +static void cbqri_clear_cunits(struct cbqri_controller *ctrl)
> +{
> +	if (ctrl->cc.cunits) {
> +		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF);
> +		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF + 4);

nit: lo_hi_writeq?

> +int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
> +			     const struct cbqri_cc_config *cfg)
> +{
> [...]
> +	mutex_lock(&ctrl->lock);
> [...]
> +out:
> +	mutex_unlock(&ctrl->lock);
> +	return err;

nit: guard the mutex?

> +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_of=
fset,
> +			       int operation, int *status, bool *access_type_supported)
> +{
> +	const u64 active_mask =3D CBQRI_CONTROL_REGISTERS_OP_MASK |
> +				CBQRI_CONTROL_REGISTERS_AT_MASK |
> +				CBQRI_CONTROL_REGISTERS_RCID_MASK;
> +	u64 reg, saved_reg;
> +	int at;
> +
> +	/*
> +	 * Default the output to false so the status=3D=3D0 (feature not
> +	 * implemented) path returns a deterministic value to the caller
> +	 * rather than leaving an uninitialized bool.
> +	 */
> +	*access_type_supported =3D false;
> +
> +	/* Keep the initial register value to preserve the WPRI fields */
> +	reg =3D cbqri_readq(ctrl->base + reg_offset);
> +	saved_reg =3D reg;
> +
> +	/* Drain any in-flight firmware op before issuing our own write. */
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &saved_reg) < 0) {
> +		pr_err("BUSY timeout before probe operation\n");
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * Execute the requested operation with all active fields
> +	 * (OP/AT/RCID) zeroed except OP itself. Every bit not in
> +	 * active_mask is WPRI and gets carried over from saved_reg.
> +	 */
> +	reg =3D (saved_reg & ~active_mask) |
> +	      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation);
> +	writel(lower_32_bits(reg), ctrl->base + reg_offset);
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> +		pr_err_ratelimited("BUSY timeout during operation\n");
> +		return -EIO;
> +	}
> +
> +	/* Get the operation status */
> +	*status =3D FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
> +
> +	/*
> +	 * Check for AT support if the register is implemented
> +	 * (if not, the status value will remain 0)
> +	 */
> +	if (*status !=3D 0) {
> +		/*
> +		 * Re-issue operation with AT=3DCODE so the controller
> +		 * latches AT=3DCODE on supported hardware (or resets it to 0
> +		 * on hardware that doesn't). OP must be a defined CBQRI op
> +		 * here. OP=3D0 is a no-op and would silently disable CDP.

OP=3D0 is a reserved for future standard use.
(Hopefully just fails, but it could be worse if it gets implemented as
 something other than no-op.)

> +		 */
> +		reg =3D (saved_reg & ~active_mask) |
> +		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation) |
> +		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_AT_MASK,
> +				 CBQRI_CONTROL_REGISTERS_AT_CODE);
> +		writel(lower_32_bits(reg), ctrl->base + reg_offset);
> +		if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> +			pr_err("BUSY timeout setting AT field\n");
> +			return -EIO;
> +		}
> +
> +		/*
> +		 * If the AT field value has been reset to zero,
> +		 * then AT support is not present
> +		 */
> +		at =3D FIELD_GET(CBQRI_CONTROL_REGISTERS_AT_MASK, reg);

I think it would be safer to also check the status field.

I'm not too clear whether the spec actually allows returning 5 (invalid
AT) when the AT is invalid, but an implementation that does that
wouldn't surprise me.

(For example when an implementation supports data AT and a custom AT, so
code AT isn't supported, but AT in general is -- it could keep the
failing code AT and just report the error.)

> +		if (at =3D=3D CBQRI_CONTROL_REGISTERS_AT_CODE)
> +			*access_type_supported =3D true;
> +	}
> +
> +	/*
> +	 * Restore the original register value.
> +	 * Clear OP to avoid re-triggering the probe op.
> +	 */
> +	saved_reg &=3D ~CBQRI_CONTROL_REGISTERS_OP_MASK;
> +	writel(lower_32_bits(saved_reg), ctrl->base + reg_offset);

It would be better to do nothing than trigger an illegal OP.
All our writes should modify the non-WPRI bits anyway, so restoring them
does nothing.

> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, NULL) < 0) {
> +		pr_err("BUSY timeout restoring register value\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> +{
> [...]
> +
> +	/*
> +	 * The driver programs the v1.0 register layout. Controllers that
> +	 * report 0.x differ only in capability bits that read as zero, so
> +	 * they are accepted. Anything newer than 1.0 may move fields.
> +	 */
> +	if (ver_major > 1 || (ver_major =3D=3D 1 && ver_minor > 0)) {

I think we could accept ver_major =3D=3D 1 even with ver_minor > 0 since th=
e
minor specifications shouldn't be doing backward-incompatible changes.

(If we fix the OP=3D0, we shouldn't be invoking any other behavior that
 might change.)

I'd be more careful about accepting anything pre-1.0, since I would
expect there was a breaking change in the spec somewhere, and we could
program it incorrectly...  Do we even care about pre-1.0 hardware?

> +		pr_warn("CC at %pa reports CBQRI version %d.%d, skipping\n",
> +			&ctrl->addr, ver_major, ver_minor);
> +		return -ENODEV;
> +	}

Thanks.
