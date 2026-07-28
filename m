Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587D41A576
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232795; cv=none; b=jxlUbacTNso9IptGsXkAOjz4tLIkBJYCXysmo+KQQyAUFeqJfibI1wBQ2zP9od2VocVL9r0ZIF5pwA0r9RErFW1lyfn2muSoMabgZSRcK3IeVDos3XWDoUozGwzuKl04Kr9QpgP8q/RBWfXRyRIsIwtl1ty2mXPqqJ0BRLjawNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232795; c=relaxed/simple;
	bh=+0Wbn7WCEuDzhQgR47IsKajWKvA2zjxBMfDYi8y6aYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssjJNxnOuz0dfI/7leDbkjDyOAAp29+XsMuzAMzdnbuWKMW8UiXigmqVcDwl8r9G4DojTR2sBAIWjZV7pEXN05wBVSyLbWgZLnWr7Uug3Fsjiii7ODhWKPXwnQzLO2eRgWEUrJrnuKfiZ6jnpBkzmo2X81wH2KtKPCmzZVX4eJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1ev1n2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1HA23+3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1ev1n2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1HA23+3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Hj92128873
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5PN1TT1lMw7TFu/s+fchO87
	W7nUXA/Ck6/FI9wxkQQ=; b=J1ev1n2UjmCEGnDr2A3w20S3xTEdMbyk2o0n2O3b
	uydHI8Fdeh6KmvEcUuikaqnKHsiZRMxfXorFisVwty213IRNbxOFTqYqI3AhFB04
	2CglaJ7ckrkNZ0aaVIds/BzE2qKPgBo4kTvMGXmIeTvgDk/7CSrYHgNYcCUKyoXn
	DU/kSTJ7rAHH/q5jiwTr1yV6Pva1HsPkvCIF11KSqlLbd4hrwQv6zFfK8jXEmxXF
	RFJthzdSlIov3kNjOQTSIFSrcJaG/I0LMHODKM3hFbk3eAJpVfGRdY15vBqD9RIr
	YJmaYfwyqdp7xuZOpa/SyTsoQTdvKpddt177lKG98FlhfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bm09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:59:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so35816341cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232792; x=1785837592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=P1HA23+3BW27APyHGGpq4/JM1Ag1Nv5rsV4bpzRotGNvQQNhgiCQLtMES3EapcuJLB
         WtsFnaFlAmhWtHXBjoCTmbk4BIzbtXOa3pE29zJ+s0WiGhYa8LzYO+8HVD2LI/rkIItU
         hST9/FkNGzu2TDgjvGpcPWtxwxDJszx/JIepVqKSKq7hA9QJsbcio6chAbUh3GiFrgd0
         hajSYexESN9nb1SuC+LgvD1HjHD07UgS/XfqOZtLijQdR0GdCFgadqeZN0rEt/klkRuy
         KXhH6RAPGR6wL/Z7M4N1w8lcrQw9eeuha3ZgYd2nnwVr8yqBNl2lC+DFa/7a4vAn3mDP
         ezDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232792; x=1785837592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=VfsQVV20wIJa7t4loExe87KxvTU7nUzSpaIbgzbhhNL9SeGuj08/YVfXuLNEHpmRkP
         fYyNNs0/Hpn8oCOjX/6elHab2oNbxs50yLT/jB89qQB1+a1HTLdrahzLUCO+M9rfErYP
         4/Ft5kUcSV1bxf8R4hDvdKjmegzVNsqRdyfofUEaAlaS8TkrswNLEXZ+GUyoyrtzuMUR
         bQAuMi4luImUm90a8tPPUQGxRkKrg/2LD2A96fZhFbg8flyGSsk3nr5rHF2+7MEWDGxe
         Fwm8Ha0IINbNCUejrWXV5fhwG6iots0CEq4HZaa5HHzyaoKwsrQ3Hy0pNMJbU8/E29G4
         Czlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Z71UM/ONXAgwOM+4dgRdtarLVpn2uMLl5PDM+eX9hXsd3PHT6yqxr7jT24GTDqc3s89Y2/KUXIL0@vger.kernel.org
X-Gm-Message-State: AOJu0YwF02M9SLFOflmcYoJNONAyt8MGR7UoGzIyC0QYTPuw7Xk/iANP
	xQ1n5pUzQblEN4zY7o/ZEI/xZWFeir8EVtIfwxyuT5I4Vv0szaVBrLy8E/oKq22yoFz57Tt1Bt/
	mulA75MS6IKv1cJCYx7sDuefCVeCAYaT8pqYV10jrWywSSPJZexsOf7/026lcqEqx
X-Gm-Gg: AR+sD120pzbp8PfGHEnda11vN4/DMOR0xfOuxc7AYCcaFNsi32VUXt7P2kKJNIu+F+a
	bAeAV0RYy5aqNN009r6CJGIkU7xvkrsfSUG+vv1kLzXuYmai2IAaVEeV6Vtx0q6vPdQ4BB+HgSV
	NlVpWGoMa1Y1iO94P/5FMh2RX/1s5bgCLUw8fov1Iu9iG+pHKFJOY8jsXYb0Al7TRNfRX09jmqo
	09IC5FjXjCggTiQyXm+bHGbGwWAk4KAT7p0xQ2QdKMmXC1OsjxA1FgHtGnGhzna+G9gpC1p8TdZ
	OGj8qoB72NtJG7QP0V9B+WlTCRAePhdMe3CK6tNiqFPJVl0VuoBCj51hYzvgTPeYkx/Rf+UGC78
	pur0RRfPfmPxXlh0=
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120521cf.11.1785232792011;
        Tue, 28 Jul 2026 02:59:52 -0700 (PDT)
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120161cf.11.1785232791475;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm212090015e9.3.2026.07.28.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:59:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:59:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v16 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <2hmw6cq6e5ba4hps46k2drdutaofcqcrczjreq7hoikmobb7rm@wbconxilsxg3>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
 <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX7TZN6rud0i2I
 712dq+GmlJNzygfKYrY+h8DBY9fT/z5Rd+nMgunfGETSdGLB2E3zYbk9BtG/IkUNHfWxsLavgiY
 8cdYRqHve4zrYaMbZ9zNQajN8B7lWCfXUJcEr5bYdZhIY/AgydSbrW8Qyy42b46H3xY9rvKimtf
 9Szm0C72ofO/axUngbjFAdu81F0Uu0Sh5y2gANwnFygkKu1hmcWCSDwi9AtyMtSuju2ny2njHCu
 uDpw2rS40kCj3UAPco/QXZowq/rNyZXoSjeuczDjJLhnZpDWUBf7yQcP4OK+5z3I+45P2SiXiOf
 3aA1SKO/EYR3Ax1LHDexVPyGy5aBcCUTckz5yFbaBpnH8AACanTpJTUI0NqnHSQ+JvULsUm0X2q
 XyoLqBWlFkoWR3o5i8/5YAnb6Zk9o4DbFOp1BzKbSMbPQY83e5hyPNx6Sg9Ub02owdk6tiPSWeG
 lQCNT4OtQM4XgOno8uQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a687d98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=P1BnusSwAAAA:8 a=mdcQqFF6s0ROXEWFMbUA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: tlNEr_coz0vxmEeVUdRyi45hFj9zM8DQ
X-Proofpoint-GUID: tlNEr_coz0vxmEeVUdRyi45hFj9zM8DQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX4u9k52AFwfTA
 ucGfz591+vuSDI8GB5JQ80hSrxRPdbsk9iNjFAJypnJfjvyq60dmj4ow+Y38/99+NYOe7ftVjMs
 YKMHS3HMBYnChooDZOeqer6vKxK67WU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

On 26-07-28 14:14:15, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Mauro, please let me know if you want to take this through your tree.
