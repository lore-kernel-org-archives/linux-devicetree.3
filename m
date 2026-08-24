Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C6406261
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571078; cv=none; b=XD2Ry+wAk9pHjk+AD2PkL4nS5X9xR4PhDZfPjl1fRzleuqXvZQQkpB481U50xdTuipnqRg+0rdKDr19ATxxjvVniJRBaa6D2J+zTPb9X9sLhxq5PEfTQvW4RjRTLbEEiFNzMd1OX0ct4PX0S2YKsvXCHUPvGaerPSo9PaJ+JJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571078; c=relaxed/simple;
	bh=9o18Ss1HSCezKpijdpsSmTTtjPaVfKlkqkGQKrki1c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du4proK+89NhG29qcLZN3oHBFcFHmDjavINMA7M6k0BzvpO8jc1sT305lNCTpWGNJ75AC1nGXC0p6AKgbqD7ogqee7n8U7GaAPH5j4jhR6fwJ0SQX6+UqZRTq193/ykhmbgm4jxC3d+8+OV2Egbb9tiIjY/KL1Uq9og94y/ZQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gklqmwlf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXK7O2YG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gklqmwlf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXK7O2YG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMY722648056
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uhZFMUq0G82N6cZ0jr/Dp8Ye
	4zJGl9JW5FIR7tFFlKM=; b=Gklqmwlfj9AzCkg/arOvToonrhf0bYY/rB+R88JX
	3w6WMi/u3Bi+iyuC5Z/s1CKgJvg9H3owZXmIpgfVN2qfyWO/yTvkxz9y8/Qja3ym
	liXTh6B+i0GkURoYSqt1egIKbsIjuYTVA4S2GymUThJ8m5yB4V4SuJAyhCNKzcrk
	cKoJk6hOpg/1VjmtI3TJ5U8NRRZ/Lbjalee64MB+/jjtG4LUjwHDfXUTHqZcCyEF
	+6hdoRjcq2ZOLtDL/ZaxPCFkoeon0XzTv36UH2wNqls/gmvgz5j0gGi5ukR/L8Xw
	N0xB4JnHmryBkKdZPwEGkkxIvj2IL7soNYf8wZSDCl+4Ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn97ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:31:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so45085051cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571075; x=1788175875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhZFMUq0G82N6cZ0jr/Dp8Ye4zJGl9JW5FIR7tFFlKM=;
        b=WXK7O2YGXeiMqLDsKbdbeAvkohzS32JwzUmfi3kCwWb/vpNMHkH3KP2JaHVnLjO7Sn
         h0qE0sU4eZBCi85E1M0gRmTQQrQT0nFlpoWA9YK38FuWt6UI4ve2k92oyi9P7B3fUrfm
         dIRDSIgP8I3BU+iKI2FdDXWzvFdzdzgBcmK1d/GD3I+65oGsum3sDfccvYxUvW0OTAf6
         T7CeYUAcrxp9fCfnuiXfuR5kv3FhDh0UHIQvAZ3pSVCkEAz7obp8fiOv8Snuqx7ZkA4+
         zEkQdA9yxm8MOnpTXwBmUOjLV2vPvMY3ra53DC8fqBu5hPOdzPGJwyJ7AUnMs6IxBczy
         VA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571075; x=1788175875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhZFMUq0G82N6cZ0jr/Dp8Ye4zJGl9JW5FIR7tFFlKM=;
        b=p/Y9082A/p2YlgI3ZOEE0qTmtqUYIzxew2qbiAiUJygqa6VqDF4Op3D3hZVf3Wc39e
         1f+q3/oqkSoenlJeOjMEZKgZZLernBzDqK32UcyUToq3unXCmZuBfeyxnY5RUKKYIBRN
         EvF0grJLUQZs9+p/PH98NoOyI1Rumv6z/svKg0SBTiQpaSzWQsuLoQCdiGZG4odDIiAP
         tZcbBFTCEHh4TltEbGZW+hz/+bvIvZRSydXY99nbKo3bU9cQT8ZZ0LecoxJqMQK9OuMO
         cm0XN4H3UNggk2ciha2cfvh/Gl4d41MHfCcltHKWKYIIuxQGVIzhplKRaSM9VGhN/9ic
         aumg==
X-Forwarded-Encrypted: i=1; AHgh+RoMOVXdQW6kV+lzYHg0jEZAlqDaDRKbV1qttO1GJBj+JnXk5RZXq81/+GULrpX8ELgSl4RfPpRl01cZ@vger.kernel.org
X-Gm-Message-State: AFuF++kVadKoOEoy2w2dFu6y6DJcs4sa0LL/VnRV4d9Ip5eK6HLb3ZHJ
	9EId/3wE1dFSSZUJCmuT/XFfD5h79Gu/QO8N1K2AvMsj/zx8PiT1wlDOgdxnPS6BtKLLekPI73D
	zgjo/q69Qy//N36PLa0BjP3oixRKEtez311eUNicmzM8479TsQ7hpYcepQIu7Skab
X-Gm-Gg: AR+sD10p7CIoc/JurZG/M5K3Gq/r7nPwPq9+7+PPq76yedqb19n3ZYVEmWt7g+9R4eg
	1rpnXwI3nTIqM60k+QnJGEGoYKPDjWHfko6/BjlDUPtUzWw+bO43n2WzFFUeRMvFkifZH/SWw8f
	wVSDJH3N+OiQn08v6P+JVS+RHK/4ig7Ir2l0iA7ULoTT2SKuoJOkPHWpJGawPdCr09ZZdWR4BgB
	q9W8rc4QfEm8qBZwYLH+mrYCuj5Mv2V+AvXeaSlonGOLzHc914Mcmf6V0qJzd4FwZNglVmkuEKg
	4/LIIAEbFWzSO+OOwPjIR6sxrkBQIytobGn8bd78HwDEpi8FXrZXtp+/OluvPU0Lta8D1wwKX7V
	vVZCCOlSu1tZmyVo=
X-Received: by 2002:a05:622a:4cc3:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52df56e10f9mr245520951cf.5.1787571075026;
        Mon, 24 Aug 2026 04:31:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc3:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52df56e10f9mr245519981cf.5.1787571074499;
        Mon, 24 Aug 2026 04:31:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1342927066b.46.2026.08.24.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:31:13 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:31:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 08/13] pmdomain/rockchip: add optional per-domain
 power-on settle delay
Message-ID: <dn5vlrxg2vr64d56mqibriz5y7ebeqezkv6f2aqf5qd2gti6y2@ohdxvj5dnscc>
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <1b89eceeca92f7857d26c5d2097bea2bce10eb93.1787568944.git.gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b89eceeca92f7857d26c5d2097bea2bce10eb93.1787568944.git.gahing@gahingwoo.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX3GAbppophKnJ
 noRQfwYx4VLqmkMo73eAqI/3ommWN1YSByYjUVaytONZLQR4Wr4Y9jN130mOnmgp/tNxnT53Aqf
 JxWpwSw7bF5Q2Mb9Gj+VfxYEuAYq9ns=
X-Proofpoint-GUID: M5ncQZm9cGuPmdO9utVhCmm6uPYBhQ49
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c2b83 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8 a=lG5QNMjPvMxfgh1q_X8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX7+Lo22uCgroN
 X9GU6EFfQmuoxHtEydDxWSDbP24R0tGNpLsRH3u4Xb/AUvSk1H8sDs+pU+W2xsGdt8sU+imDW0z
 6NiwgH7yElR9ttvobcwGsEa1x3knOE25oeQ1ExSd0y3ImShfpnqfV+ksnokzoWjVojWhzk0CX6L
 dgmTCfFNNsLnrDgTS82bYV12qhSNcIHJJOAJGSxK0z9BnXj4k2d8/4Mo0c+xLmgZkblULHL/A1k
 /cu4ZAUdKSvgPXylUPsuQT607w3E8WTP7Q6LM3HbFMygm0v8U8JYVQqq9x8yZhmr+ZghuyYqtN4
 nYXelaWxywngNFIIBYYU010Vl129ikKhEztkRmhv3pi0QFtnMhfk512xF3QtTuChQdaLT5gIj8m
 Dada1Gi1YYHTT+SWLdfnRxdszSCpdvcydXqSjciQNCQSSG9vC7BYkHW7halr2PgXJBWYD6OdMnN
 pTru1TeFfWnD6rC/eyw==
X-Proofpoint-ORIG-GUID: M5ncQZm9cGuPmdO9utVhCmm6uPYBhQ49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

On 26-08-24 23:08:57, Jiaxing Hu wrote:
> The RK3576 NPU domains need a short settle time after the idle request
> is released before the registers behind the domain answer. Without it
> the QoS writes that rockchip_pmu_restore_qos() issues land while the
> domain is still coming up, and the NPU throws an async SError on the
> first cold power-on.
> 
> Give rockchip_domain_info an optional delay_us and wait for it between
> releasing idle and restoring QoS. Rename DOMAIN_M_O_R_G to
> DOMAIN_M_O_R_G_W, since the suffixes name the fields the macro sets and
> this one now also carries a wakeup delay; RK3576 is its only user, so
> the old spelling is not kept around.
> 
> While the macro is being rewritten, give it the regulator argument that
> DOMAIN_M_O_R and DOMAIN_M_R already take. Without .need_regulator set,
> rockchip_pd_regulator_enable() returns early for every RK3576 domain, so
> a domain-supply in the device tree is never looked up and never enabled.
> Add a DOMAIN_RK3576_R spelling that passes true and use it for
> RK3576_PD_NPU, which is the one RK3576 domain with a rail of its own;
> every other domain passes false and is unchanged.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
