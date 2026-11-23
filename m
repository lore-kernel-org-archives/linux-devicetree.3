Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448335;
	b=uBfBc7ZJ34PHzfPYK//bPaVd1Xr1y/OBMykwEfB9jQIydRc53QFiTP06CAtVi1cbWvTc
	 5bq5e0I1aXn1ZhRfOgidIZ9JpP1vyOiolJhCJMnfYEdzDT9zyqQNE84woYUX3Ll4TyY+/
	 dYCtHNp9L0pAitIENYROEXWHvtkDKokBdmWOZcOAWwWPTA7Yk4TGXVo1GCi/1Nc/JYJx0
	 gQklg6b7G2KxqB8j8RYuPD1FBMLoHGd3x1Ww+EC1kNRFjoEpdBZh2cjs3NZgu1qN8h4Ht
	 EOx9RuLRxlKiziXkJfythhs4j2QucHr7GXC/BLCUG/fGeBHVrM76qHvoffSsfbwW0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
	b=3svICvqzvHIVVolm3B+4I+U9wrwZepmcfkyNuXynxittNRGb5ADDORN+/577+SMyyoX7
	 +/P5qoMbkUnEFO6IIwPC5otx1dnVYAlt6mKOgpAUY2BmKG5VpcLMIkqViE58TYuXTZxi0
	 iA+067HUDK/QKOYaSF3H1F/cPLz3D0G5lF+F01wKaQ/CZxKSVy9X06TsZorC6uiudWG6C
	 5/fBBLQsEjaQJXDyLXM+LU1DGwUBBHavqdgAuSMG9X2zC4i4brXmH6XrZ7VcAxliCEq73
	 /PX9WXg72a7rLuT429h5rm/sHoUji2NqQELMnrevVGi/iS6nR+8S0yHzYtGyfOAdLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="etiSRN/Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQ3f1QFP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F23606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F23606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etiSRN/Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQ3f1QFP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKvjg2086005
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=; b=etiSRN/ZbBaGQPfE
	PqfRvVxzdf8I7UEJpZ95lYWONGlz2JsFbKdHzfBUlUXKEjec85yz8hBhWOcomrTF
	y37JW0So8DEWJsxGF0cipPSqiVX09gBwWww4iyjJ+90vgzEJcSFvLgq6eSVF1iYD
	z1fDYSoSGOlOr5tBQmAxpfLjSV8aI+kOxausb+34GHglWm7fTelZU2YiWDrY5LwP
	zJfR/QD2+wXLZAdu+jMzGoQNantoQJYhNTG3Y2UcmYmACqoW9LvUzCPmpwx6PVhM
	bUpTBkoJrZGe8WZ7Dxy77gHADmSVE4eflJKJxCIi6h9z8yfsTkjWyJN5JxRCoHGa
	yOm07A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy0249v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so100188e0c.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448334; x=1796053134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=eQ3f1QFPuCPdnxiXDikUBEyc4B0S0VcDW9fs+viDmojcqWiTqh6BNpPUnkW2nWXRkv
         Z4MCx3JrFNZ0/CxUYRHlyvyhxGtL+IOFR8U1SiV5nwOXA6hi3EHPjrZX8vLnzi3Skt90
         woYLB8sbbz0jo/yLmYMHoT9GkRHV+IUswFUSKo4V3OmPZPG9VqG2BdsR5W3prBE43FT3
         PY2W9QIbQvLdbpkMjiYJyzeQ1I/43wkjYOJWk2evNmHz8YzMwdVH3lsXgZ9/3xztu12C
         dkSFaw3R3GnTDaCr2HlDG/xykHTBugBc+6ndt28ZapeRPm/0H6hUceKMIzKHFjbEroL2
         WjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448334; x=1796053134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=eBODK3TrUiugFGqjIh3AVxmAaztHOXUdJEC23dnBO30H8bOflSqciWD/SkZQBy+fkT
         VmSXVLRA1g/3hfrefb4TtEXrBePGIBH5hBMlzk40teRtuxyW9ynvZfDwiF8psTZvaYp6
         3RBGdtnMG9wSiw+GSE+I7mb4UiTxNgMYHRbCF0iD/Zyec/BQrOWWcqkcE/nYOfREOInt
         1P1LNXnpqLbzyAX9ENmRkbe+D/16hhAZ5HbBYZMrouEkoqo811nQ/sjPHWL6ooikImb7
         CSIKe5Eekphiyd0OZhwjJwVEmnTVy86VO4YY1on0GysLIjOzEUenYvC0rP0G1Yswg9Yo
         NiZA==
X-Forwarded-Encrypted: i=1; AL+hErHpnWLtn95Q62buzHeMhZM6qEJJ4hXFS96wxup7blQg2OSQJjj/iX7/F4w8Ujnk5QgDXUGYx6YbrKPK@vger.kernel.org
X-Gm-Message-State: APuU4Z9zZHBUZUZVyZeU0gnZAEj4GHSKtwyqkff/AkhcqOlGV4MJERIp
	IGBhx0gI9Q9y8CfsgKOJsNn3omLFbxaO5UrgUN0pt35wgH+v7Z3yDDSPXnaEU83KBxoCr1omPVd
	vB3/Om5N4l/8gApUszVcBuPMVjpc14SIoPaB70SMoriDV8l++KNAwqUkj2I38ePai
X-Gm-Gg: AZFdTZdW8mf9CkTvWT9drQRnlhcUUeyZk9chS8mFC5ZLQ9QRpBTtm/Knxd6pjVQK/ff
	r76Swrrq3tsc3Ie/AUs/c/PSYMgJ/B/XHV9fDMeriRDXg2OaU68NfHRX/Tfa+6lmwkht+o8vRef
	MQlgkVgFgXK3BybdK+Z5UnW02y/AS9ZvflWYTlf3FE/QaB9O2cwPIxsVc4tHSbbfNYDRUjLG9tF
	3M6X2qwmI+3Zo+KW45pr6zypNUMPpBR15fwg4UH1CZWmTilz6ZzkugED9d1TT5N29UdAz4PdvbX
	c7na+46pZzcPrz+arMUlOScr6jDlZdjLxYZvhmjfjMF4U2YhagcJj1Lij5N+Nq1IqXhwD+SW4sH
	cEzuA3WH07tAoe9/ybkbhlrVc1v/xt+kwVfP0txbzzptasUi9QUQnZeqfwNWhlArs+QGr3qA=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871889e0c.2.1795448333413;
        Mon, 23 Nov 2026 07:38:53 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871835e0c.2.1795448332884;
        Mon, 23 Nov 2026 07:38:52 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm3621677a12.36.2026.11.23.07.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:38:51 -0800 (PST)
Message-ID: <f6eec0d4-1d37-4bdc-b09f-8bec0dcb8dec@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:38:47 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, stable@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX50MM7NloLbHT
 zIprjsKlwOY/SjXrYrJ025MUreuf5urODdaldlKdLYzV8QC9xP2PjdWqmopImdqD28clePETVjV
 9iqpi3gntgYHDlaU2TXN7tzAyAFxuuPDmGZKw3oLrwAemKqawWC2C0RO2pdO7eNeFbql5LAgkfg
 yGvpNGS1r7vyao3oSUy2LbO0sItVW6/reY3rJiE30jbZnXnBAURnl92JB3Y3C//SiAXiRNJCZRw
 ocuvsO51GrDvvOT6T2I/oFQU0LcGun3YEjuH24zGmNIJqYgXBAaA8Mxxv+xlkWSmg2NedNDn8LT
 n0NWA+UqYOmG6QOXziGYCuRHUag1O2gyJ9HNsl96gC7X6I4z0+bn8QunsWe21PmhWgSiVYklf7m
 2A5vg9ai59zrU3kfRfZQAJoNM3UViXcfHm1NcmrkBb4ZBcLJ7hZSu1kqQk2bR4nkWiA+Rzk3dbf
 1h+aa9rt9g0cDXB8dYw==
X-Proofpoint-ORIG-GUID: oL5ufZretSaycMoP-sD9rvp0NXeprPAc
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b045e0e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Knk3v0qlAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wt33j95wQlzQpC1BO6QA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=L2g3GqtBoyQv0ocsUjqh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: oL5ufZretSaycMoP-sD9rvp0NXeprPAc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX/JEImb7dsSYY
 Egcr6BW7t1UDejKKEYBdlwLfPFU6eA3dOsA2Gu53Te2ZzbSsuUAdS3bOpqlI9GTOtRmyGtZrHyq
 5h6P6J3YB0XyA68bMgpNKjWc4IhHGaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, so
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs.
> 
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc node")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---

Docs say this is really a rising-edge interrupt - perhaps the driver
is wrong here?

Konrad
