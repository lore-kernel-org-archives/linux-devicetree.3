Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738645;
	b=I/d0LX1IMQH88xn5Tc5bi0055msIaAolnJ75WBEeKCux6Pf+mEMGspvBFwlA5C31uiPk
	 jZlrRKeFn4WbvlG8MwkRVauo7C0ZCNqBCmxb6ft2yJThaG1QafcXl9Zg374Izg8Qks7+4
	 CGwcp25EOrmBGKqvHanI7OoyrGHddRJtLyoqpb7nYX6EF0dMmpaUNWSEpX8T3BwQFloIs
	 AIpj+cqGdI9fJd3V8/ws8ht8sHByHABMunnIJZn8gOpikgEoPX4p3/fkh5M1jV9bstgpU
	 mcK3dgRz2CLhRCXQWpm92k4kWIMcF21laeZcshLy7OQIYTv8nVRdsPcZwtmgu9YgG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
	b=EGXKlUSX6ln9K4nhL/QScHbcczhV15xz2D5Gw1MnyRozL/iDvTXYjYWqY2rvRYLxoFlT
	 8B+LAgURAEqs3bJoWojrqFg71qstKKGG06xpWjmPyIQI1h+Jwh+GI/Q2fQLWTqJqUT9Dl
	 7AK2aRShRdmqVXToCXKfX90erTWDBlFaZl1tmWFokZGA3GwtJwS1ARUw+YF5bXq4Pfk1A
	 dYekdRFJxn/qw0gb/zIX6oP/Gk0FP0m0TudH/0wK4GCN1+FPdxjVhOnjnjBc+cnteTWoZ
	 oQ4jr7vKXE7fR6HySgz2J/U151pUqx0lKIDABoNgH2FBEqphd90nwKS8ABFZ75ga8nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgkzFYYh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB165606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB165606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgkzFYYh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F2pl773217
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DcoXlWRKjuA3ss6Tbgxr6QeV
	j4UArC2GCkRmhAMcuic=; b=cFfEZkKzP1uu2iyYQz7OI9qk4OXKzTsnaPoHyKaD
	JP1XeIGyQlTOtvR+y9SP+eL1MRCnTFUcTi9/gFVo0/mnlIhCuRHmC0aNod/Tk3LF
	YpvsVF3lD5MZUKL7pNMmlyAv0j5Dle3n1PyKGSsJ7BjcjcWoaII/dQuFJC9sO0tD
	GbAyeJdvrpHVMK/slqbhA5ng0ope0skxgIHXH9hpogKheQLEw1C8QWi5N4sofmV+
	BC5CahCfZs304bu9gFujPQ9176ooSoC7dC2CzycMLoYe4GYbnA9/t+ppfg2zkf60
	FNqSzJockmnr7VyZkdy8gAby+MBs/pwyGkI9RYL+6Z0fQg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttb42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:57:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aa8f8c2638so188521a91.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738643; x=1793343443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=QgkzFYYhwUKV9b3HK59LHPnqqSaqEOzQ+Za2Ptea5nVHdp24b1JThnSv8PgxAh36en
         Kwa+rdlQNsRCYRl9oMPaQmJ1KFnQFYaSXCO13ZZbRTTCJ0vP6E0flWsNj4HLpAe5NRW3
         1OX7SrlhQChuHXPfvWj0UksZun7dleP4D+LEAF9PE8N6gOqo6acuTUEUKpNBiMawNVQ/
         MGqVVs/8mk2WAr233b10JQSBvAHYiouZVmFbnbzcGeRI33YaynK+zuK7T4NNpCyKI0lG
         YLd4R9UX1JeNnMaTX4xu4bGr2UiSpx/51aWFGjWcWGSJj9ps9zgnOjGty5kjn4ZDNVJ6
         m4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738643; x=1793343443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=ZM4pJP24bJdbNyCtKsjGH9Z5IE2TMtnMJjo2IZ4O7t0n1WrG7viGNIXmf0DycZB0vO
         7Wp99lQ0/3Zwp2vH1G1jONvn5O7a4qq9wQBb7amKHN2hjAVnqnNwJNbkV3PmqPKawfQ9
         grrhUQNUTtTRI0I8OWR+gOYjQxb9lPlCn1qr7LeBYcMNqZBbgVpKueT8g0vIxfps5A7/
         OHXnm7ef8mivxStqI5eKm4N6xAmflnFPO101/X6xoDcELxB5g1XNSFG4S1wVjVOheOnc
         KmeDQb9xm85/v8ELveidwqbd7w+VfoswUjXT8L8itvoK+7jwwNQTmWYxLMIN61ELznX0
         iWUw==
X-Forwarded-Encrypted: i=1; AKwUvBxlnhiKs/oqADDywIDRtv4ZzdJeTC2BPAkEHr/1bfg2ngMR+Zfu38x1a+F2PoxgSdlpJcra3Ua91128@vger.kernel.org
X-Gm-Message-State: AFq9FYJhkKgk2Jl7mvNtbSJNwuOFV4hSXCPzAb2VGgtvvFt/Oo7qH1dO
	13YaGPEOwxdRuDJh/oacJGuhYPQAF+XM/9o6786jFKSWfKPH6TmMMJSCX8z0JHbec/Uvu4KfeDQ
	VxTQ5+fN0ZnpINar1M/AtnPpZS6g2FSG6Q0SVog3cnWz+KTaJj967puY19YDH4ZkO
X-Gm-Gg: AYBFou0tS3DdBhOZpC4/MJfoZ2AQ1fPeGmuwjFIx4xv/56ZxWElseeFEfKnJ2e6a6YV
	byHnUMZNxQGHddAKoWVRbBTVrVkFDh8F6psu21HKUaScnrHXGELhhg/kyiqglQywjkXV2Xy2fSn
	G1SVh7yLKqQyDwH0W/uvIVq7O0fmy7h/vVIP84G/s8uGrN/V/Pj3S42s6cnf4PLrHCKc4Eq0uKU
	D9nKrSHPR5014zObrosvm4Fi8oTzpQpLav5pne6wFR2uTk9QOp+Ps6WpZI149aI2T8wjzG1AyLX
	YOs/6p+LbioI8O6a8T8N/d36nEkPo5aFddQza1Wz4vB3441QflUpA7mNz5tuBEdegjgGWo9r/v9
	+2xeg7aBXvKIUPy1gXntHTqgsUVSGz8DYmXPDy3Q+CE6NONdYuY/zabcppE2EDM9IuaglnYNAWg
	KPcCjmWR4kP03VSDCr/ERZE5NHoBEWTQd4Y7ki19mM8DlbAiQAER8=
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847193a91.4.1792738643195;
        Thu, 22 Oct 2026 23:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847153a91.4.1792738642568;
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2994cd2sm650567a91.3.2026.10.22.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:27:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and
 touch GPIO drivers
Message-ID: <atsFS4y9cnfKL2uk@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
 <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb0554 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=phjb7eYm-OhZhg8tdxIA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 8DW-jRCMBPyMm9hZvVAiE13Z1O0sj4SF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX+zrthZZ9Yzdk
 EEC9Qfd6d6zRYqWPmSXMpsO+6ik5QhP6e8vAwPBk+9J1ugIF+W571r599dZed9RulmKvr6LTPW1
 Hj+RohWl0hBWZicA2iwT/IwOXloSLY7E8phRAbH0Sg3e8a9I2EVqghmEx+goJcOSdm86YM7wYWc
 9UAI3VBCMvCZ1XUPKrNoIvu1QYhWXfukSaQEz8MFXrdx3ln9LGiN19gUexZIHvgbp2F+p7z42gT
 slYm39ivJ4+/c4QrwPuinIs0K8qoDVNR2KOydIK+/BzsHYveWaWI41h1qX9W24l9jQfW5DhLluq
 g9oVfYcO2V4JuU8DLZ1S3jnqfJhXwgXoS4xiygP93AZrlqcA2juSofQvZGjq+DnKmLM8vWaQvxr
 m+Wbk+FxFlhzaJ/Aqeb5+U764BZbp871bFJLsmh0szgjUf0OEdbXKW+g9Uea7ESx5fxJ42m0cSW
 jHrtNvI5mfYamH3EIQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX7nKKZ7r+NEnb
 2AKl6tVCQDDt+deqvfuYew67SQTX1Jc9YUtnBz9geywRE9ZfDIr9fo3WOrGXwOW7zZnoa0nH04h
 bv9Jr/U3aJGyfe3RFIM8UBnOlpcXf6Q=
X-Proofpoint-ORIG-GUID: 8DW-jRCMBPyMm9hZvVAiE13Z1O0sj4SF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027

On Thu, Oct 22, 2026 at 12:45:04PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the Waveshare DSI touch GPIO/backlight controller driver and the
> > Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
> > inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
> > EVK, Talos Lyra EVK boards.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> That's not a separate commit from other defconfig change.
These defconfigs are required for Waveshare panel, defconfigs in other commit are for RPI panel.
 
> Best regards,
> Krzysztof
