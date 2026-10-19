Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449340;
	b=B32DDshIbJ5hVcfhNQgTCfSGLkjT0sHB1OFaSC9wq3G+JnG/Zsis5k1MJY8w+LtcrvTq
	 G48OTRgBBlW9MoWpiqBPQDY8C5Zb2Z6V4OoNCTDgUMOk3NQ5gdoS+P8iy9TlZrP2pK7ad
	 Wg/fetVoo0aTJCk2+Ehtrqpgu8ge/QiGLsGT6KJJBRL7HcIkbkIoP4+HrvhH1xA3D++Jj
	 p5sfa6nm7uI8zGCPB4dNyEorayYA487vT6i6Zaag0pnzOBdG0/jeoSWwYsppbITMpHJ3k
	 4vSW4eAitbyYODSZF7T1MsbGiNR4Gvfuk/fuSj+jTqagBU5hBIkZAjMxlU57DKlYYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
	b=ANLzw5ncmHFVlVrQ6Qr3TvwSTJmqrdf257GGevmdRWRye6VF82EtP2CMXIj+6+TZpd5j
	 rsecOKmyFe79LofjNA4Ia3PSL4WVe+V3AjWorLDGsOCROZG5WQKHsVS0KgpRazPdG3R/k
	 R39YOq6w+lUsMvdS5V+gSiDZ+GqubyRj7Sif93aTqih+BPTk9F4r8vq0xCWq6olSRW0/G
	 7y+LwKX+IWRwhpg2kR9dkJeHp26Of9moj8H9QEig45220eB6hK293YsCrG0g41icDhKTb
	 1qasRqvEgnZAcFoSDAU0itf2zR5oxcY4fjn/P8liALbIqYafmltHFh7JSLubARKLcyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001F606A31C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 22:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F001F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZwJp2891563
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 22:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=; b=YKCoiIDFqykGqAD6
	2GXQShRnEXS1WB5jRGVqj0fkjbTtvbKoA6gq8EMv05sKwSnWk6RLqQ23CDD1GqOq
	/rS0Rkbkpvpu3ZMkOVDqOc260HZYaV9CnLCIUzMckBu5pxx30B5QkYsgdIgDIjau
	mODtD8TtjqNl+cpVDb51HhFiIziII5pTnwVESuQPUz1Hn37ssWSGLWp1MS4K4gTS
	scDwmnv7nI11Bqxgoh1vthOZ7YObh+uZmyWb5dAqpop9Ei+qesz4fhyuun1t5TAa
	sMGpdwX5+02tpIrM0eoPJf6YjPbXFOMlr80kI1TeRq+Aa9SnU0TyX4U3hFUNy7D3
	L1FP3A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4a0wgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 22:35:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso4075620eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792449338; x=1793054138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=jdNUPsM2dp/a2ALnBGjQwJ70USU3zOzLqIw3zQ+tGfobIHEv/7TT+sKW/y2KuCOXFt
         Rp++lD5/vde8uL6jjqzexemf7vzEgLpt6r6hOse6ecsjfT63pDFj2R6ydLzg8zmdNTLk
         HjiKhScurdWRFNg0dhf5vvknDYo9GlftZmvlgURuljWnjNQRax3fa9SilDUEg1M3paGa
         Clse6MkgjOrGRXwm+jUMiXfELCxoVJdcLkEzeX76GwCbvD/j5z+ydWdiLDurdVpXmMqG
         q/ewQU9Tm4yO5yQvXpdYY0z3Yf5DVFjL4GKLqPs1+hpSMcp8arvOc6eHkNP1P0XVTnuO
         lUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792449338; x=1793054138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=KffMZAmI0KouRIrTZNZwy5eMVU0mcgPivVaerTexpsr5grBTwdejJduhqAuJPnzgch
         H/F0yAK+j/goZ4LgvOBaoGpUiZztmqBelfD0EvAu+eLYv5XW6+Cunai4E+TVgq6DfPUU
         yZHOJ0WII1KaWzEbEEv2AUqCfOx5BgnfhcUAde8i3WIxxp0e8Itmgp1bqdVFI5nJqK0u
         PVMnS5p3el00sQ2/xeo8X7eZQg3xUfOE9Lrr12zqLoSammR444UuITIE23opD3PoHKfR
         ReP2ilz5dX+eFoh3ELqKTx2y2e94UqEtdMeHfvxlNPYWfl2OUrRe4YkieCP/x5tYtWjm
         gU6g==
X-Forwarded-Encrypted: i=1; AKwUvBy2UlV0595lmbxNZ6BXrS8+jDMFDTwobeuY9jQRQAN9dm6bR1sUNXL1WD5tYoccPgVipSweV22StDoK@vger.kernel.org
X-Gm-Message-State: AFq9FYL9PFwWZMTzDATMJ4NGYi2kcR3iQ8bniLOdixXDcqIHF1kPVeOB
	PfgG+d8D49zG6UWKSbv0wuGSKetX/TsOJtfqBJz6oyo5UBW6P0w7EH/j74DngB6kdCqqmzmcwm+
	48yjSn0nHjLTp+JiKiA77PIh90nArCDNQ9ZtxlFwmyZ7Xot4PNgKrwdyF9YMvOX1AnSNR3BXV
X-Gm-Gg: AYBFou2uSdj8wtA2aXbLEL78f2b/H/lXbr2QL08a2oU3FfDx3gSlminVwVQ2jxjsLUo
	4Gzzo4XFQJjkZDVVJ1c+3bePU8hTT02t9SwYZtyWSVOiP1ZeJEDUw3FWA1vFCu2p/3EXNOvR6FV
	QwClc7NUeRnT/ANgKbGhqHXe8H2I9jqbTHGkbRU2tLzOMWEYYXUk3nZ4wj5jfxChfLpA/QlXEtU
	rsqpf7V4JyTJF9b3Io1qmlu5IskzcyqwjRrv8yYfWP9wNLhT+TKjvB7CvSuFLGuY5ve1nsS8vSi
	IjEAnc3hh0mWXnI1F7LIPfzqKsv+9gBbeRWxqSkLCnUQgqYx5jsaSIAIVZ3rCyC4PoZtUWCauok
	Io59QGoXgzW6guUW8401i9LnIHIeRz/W12Om6rsp2G8I4SHg32cwtxSTa
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367186eec.29.1792449337809;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367135eec.29.1792449337243;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44127084eec.20.2026.10.19.15.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:35:36 -0700 (PDT)
Message-ID: <a06f3cc4-b457-41af-b981-0a3da19da87a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:35:35 -0700
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
Subject: Re: [PATCH 2/2] media: qcom: camss: account for C-PHY when
 calculating link frequency
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
 <20261017101227.61271-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017101227.61271-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfX+0EoQVHxTW83
 O2vF0Cp+dCGSlACFWD0Yp/Vu73syx15pWDjUNtjJNXBTWuus19tg2RGyKqOTcth8Rh6BmNBdqUd
 vz8xVaTPanzMxn3AYYpenrIY2oLVApI=
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6ad69b3a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2yIVbSAsc_rmbFz1E4sA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MYLmtjkBdsC8PY1Do4FA_aSWVjDEdJJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfXxTBSR8y8pBuI
 RFzVEUf0m1H0Z+J7ASZHa2DUXqspLehP9rvRUvRJijN534HtX/m272cEBq4SNMIjPqyRQdRkTsg
 f9I5hvRbJdMbDpn4/bWHk9fzgingxQHZGm7s8N4gmy1W/4AG6ZTHZwCCkpQUplXnRg7E+Ekpaz0
 L3BmaJmqhjMVo2SSVAoo9Ymjdged+VCkhfnJIhbBLZ1u5is9mrN5ssCNeB0iNm0BVO9SOd4pevm
 g0r4q7D9GrEOHV6hpNTaxiJMN61R49o/oJRF6j3NU1qfiD4TYNF0sBOMnTaMpgnjYPkqVXCZRFc
 f90Pc05yT+du3WK1ygDYA7jiEQwwsuCTAXvNaUkfL1VhHzF9LFmpCNO50nau0kMily/kJRecO2c
 xZ6fNU9wqkSU8F4tViEz1KPYhEoSUQ1t8EWBJibAURGfhieRaXnCAGM6ZE/i4sC6yhwn6Z4RnEn
 yRSjlq6SByYxHuQBWGw==
X-Proofpoint-GUID: MYLmtjkBdsC8PY1Do4FA_aSWVjDEdJJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190090

Hi George,

Thanks for testing this on X1E80100 and tracking down the csid_ops_680
path, really appreciate the thorough analysis and the control run
confirming both front and rear capture work correctly.

Let's fold the CSID-680 line into this patch. I'll add:

val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

before the CSID_CSI2_RX_CFG0 write in camss-csid-680.c alongside the
existing gen3 change, so both receiver paths are covered in one go.

I'll send out a revised version shortly. Feel free to add your Tested-by
tag when I post it.

Best Regards,
Anusha


On 10/17/2026 3:12 AM, George Neacsu wrote:
> Hi Anusha,
> 
> I tested the CAMSS pieces on X1E80100 and found one extra receiver path
> that needs the C-PHY select.
> 
> X1E80100 uses csid_ops_680, not the gen3 CSID path changed here. The
> C-PHY flag reaches struct csid_phy_config correctly, but
> camss-csid-680.c leaves CSI2_RX_CFG0.PHY_TYPE_SEL clear, so the front
> IMX681 stream is decoded as D-PHY and capture times out with a zero-byte
> buffer.
> 
> The equivalent change for CSID 680 is just:
> 
>     val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
> 
> before writing CSID_CSI2_RX_CFG0. With that line, the register reads
> back 0x01300000 on CSID1 and 3844x2640 RAW10 capture succeeds from the
> IMX681 over one C-PHY trio. The rear OV13858 still captures over four
> D-PHY lanes.
> 
> I also ran a control with your posted CAMSS/qcom-mipi-csi2 module code,
> plus only the X1E PHY table and this CSID-680 select: both front and rear
> capture successfully.
> 
> Would you prefer to fold the CSID-680 line into this patch? I have a
> clean follow-up commit ready if you would rather I send it separately.
> 
> Thanks,
> George

