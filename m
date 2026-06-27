Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70FD34389F
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782587181; cv=none; b=QQ58BoJn4fHyuqsJDkLai4443sZt8wIU/Od2UbkT97HsJyCoKsRcALFS+IorohNuZ+enfyRnMkVQf0BWNVvOgLShpeoQ0zxnjCOSd0HKS0BIwzyVf+lx+SpbmOI5jookU+/6cZdTBUx0t7VIXK/w6AFsf/tL1tb+EwRqfWmmFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782587181; c=relaxed/simple;
	bh=khM8Yp5nAyYnwso19Te0A+KYlarFFg1xfopd2gQ1Pfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntssaxkWLuyR1rhXsiCbatOTMlVwTmGqH/HNeDF08JETpYBDPEXZtEGlMczX151dwv7UBK1/vPRH1rvwRWc6AK7YGsnLn1L38K6d3rvTsv8pJq7+UowojVcW2Fr+OcXGeIb2D3g9ikG92+v0YOqWwMAxv38I4j+/NpXyCu51hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1ebHLO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwVwqOdD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1ebHLO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwVwqOdD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHniao1717826
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 19:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiHIy/ks5uS
	xdFF5i/UrFUslo/Ct3YN+jKbE+6ijCVQ=; b=W1ebHLO/L8PA/yEj1474lrWOSyW
	WfcSqEAS9XsapPzEuhGrisKQypR5zUzp5wy6m573RrpM4OkJkv9IrCUf5iMzisM4
	04Z6wSdfo1WeaHrgJ5qQm4j+sW8m4Pfe8sMMG0lIGd6a3fxHlyBTxUZWlT4CMm03
	quI8Vq52n14R0ai0VwYpNl8w6qNanxNILbjU2FqRdIxWLIGzO8hk7mUDLJLL/N9S
	iLugunemiPILNz7Gtvw4IvKdKEepYCcydhMvuvpDjqIi5yRLwe7yjaEJoGgh9mZT
	k2rWdgXgiYyMFcYH9XqdFxs1DLCdy1J5+j4nEERG9YGc0lAR+nSzXZs/0lQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6hhkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 19:06:18 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7fefbbeed32so33922957b3.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782587178; x=1783191978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiHIy/ks5uSxdFF5i/UrFUslo/Ct3YN+jKbE+6ijCVQ=;
        b=dwVwqOdDOU5i42TuWB2MULwJC7gGt1Tf+yVztIeTR/BIZbOOFIdFQtdr6DJj0+w3m8
         xbWJ/+FQ50oso9M79bzlnf6dhHwaAMVfzzzA35Wgv03r5IOESjIuqQnNxFaCTDSsZinV
         u+GO7idBZyYRuVPdpP+ob7jjz9SaaojzElR5agz4OqhrocEVkMfZ+CnhOM132H9Kz+Ze
         UwaBXC/ERWTBk1GKKFRUVgFFyQmstJlv9ep04pz8juW3giHxrCIDvMGupx24uVL0C/9W
         R8pPMa2jtKULktmdswJBoRS28ImnGtnGDIJ/fK5DT+dx6Ur6vDzRjaMsXY+UFHxEdZse
         w/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782587178; x=1783191978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiHIy/ks5uSxdFF5i/UrFUslo/Ct3YN+jKbE+6ijCVQ=;
        b=J3jrIkF1AcRHnJmUdM2r9uzQsXvKXIAS58pWD4v8ocl/iQcV4dcskdahV2PQA1HHAi
         iFEwBh1r/LteyHO9ESmUWVLn4KYovs8ss3QNIQO3S66myEXty4V9PGT1azaA9PrqxIX6
         thRGIaVAj7J8H4Nqm40hpT1YhYdx1+HHDSKNynIeLipRWdgx1kmwCZ97Qt6UZv7rB0lb
         7LIHIWgRNbXbI9DgdFoK5ugioQnxQgq2bApMxuLpqMvr3qnehKodd63OHocOQUaYNZJx
         38nGx7+sQjfpe8Jf6ULucSiyADSur1gjeWNgqSi3inw7TaRUjhsP4/cpoeTjbyzY4HSk
         JBeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMvifSB8zkYcsa5O3HBd4yWd88hqzOQ0gx1occNddu4KQ1UHRO+/kfCD8pdxZQb2WCu1AuZbTJuuMO@vger.kernel.org
X-Gm-Message-State: AOJu0YyU03apD3qR7DY438jPhv36CzFUEJawniuYiqTQ11TTEIrP1CEs
	eJPa8/wARNtVAZzTi+fBbU916VEZMvpFBmtnxSnn0AyPOHer6OtHVHIj5nePaBk7qGRzzImP4jK
	SQ3whDn//qXhKby9TtMI/Lu8j8wSvkZ8nX46tQjO7sg1fyYbRvVus6Rz8ZUxBUfdJ
X-Gm-Gg: AfdE7ckRmWt74D2VCyE98o5J9rEIukqYdvKm8jozs0tNeMwh36+/lWh6WaSIjD60YRd
	Xghy5zEQbd5ONb9KbBscLdEsBP2nF9/PXRLrD2oinio14/LRVA6gGRn2kcUiIsWK4DJtjGJcRAi
	dloZWfiFisvV6ssPnSDfice2LY3Eezun0DZhR7GDYG8lIbOK6+J0k9aWLLEvanNKyxwUHGRIzQH
	0AaLDhuJzwKBu9wQyoQW31+o7i8tro4yVIR4RI2O2wnMMtEOZ8ykY5U1FqeUicOoQzyqIGJJTO3
	sf2A6AVCfNiaX/BPD5SdUdg0ws549bOHMBx054KPvhlYlf3PiLkoEnnT0Xs817iRioW65S3EP0X
	7ph5lMvd5nDvzWGEg2atEDG3e2d0dG3YnBYs6amOV6Po9QSeAfK27ZmRxmD9dGnRnGF2F0ezF7h
	hhjguCcRCYmX98XfMLeYqZs0qzFiYdFg==
X-Received: by 2002:a05:690c:4805:b0:80c:fed7:9cb5 with SMTP id 00721157ae682-80cfed7ade5mr37632727b3.2.1782587178284;
        Sat, 27 Jun 2026 12:06:18 -0700 (PDT)
X-Received: by 2002:a05:690c:4805:b0:80c:fed7:9cb5 with SMTP id 00721157ae682-80cfed7ade5mr37632467b3.2.1782587177897;
        Sat, 27 Jun 2026 12:06:17 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf6248bsm97990427b3.18.2026.06.27.12.06.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 12:06:17 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 12:06:15 -0700
Message-ID: <20260627190615.27291-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ohxz3n9iugoRT63AKCoIWQq5Wlop3gVR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX3fzp5PtS22+x
 z2TvZqN6n6Xi6QMm4jAhaMHIKFEXY++xPG47jn7sPnnvK16f1NQJyEk4vOUd5t0SOjXBDu/kd0W
 85B9C6hjPT7EhJVzrvBh2otPTJ3DGwI=
X-Proofpoint-GUID: ohxz3n9iugoRT63AKCoIWQq5Wlop3gVR
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a401f2a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=-S1dkTAofOBTlHLHEW0A:9
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX0NDLa19afpyp
 E4ROdT3Nwx6qDXloPP3STou89vS7c7/DKIxPE04YmcKijnF+61caBCbKXObtH1S8Uuu1fL2ZWzL
 VTNeRDLy1wWQl/L2x+uYCARSA+raRjbg9taThDFwZbVVtRAtZBxlpcsofnQ+5+pbg2jCsBm/TVw
 sHtsey5D6ZJD6JwpfRaoTHS9zGoIzF7aC80sGmVyUqV+hF9I9S+eVU3IAgqnAVRdZKZ1gGHHuiM
 vfL9qN5bodSfmrQLz0E69CY/Om1GdoclqKpnkbOL5yYRLgVerpFjUuZ4ArCksieKsfzD1ngnZrc
 OZzV9lwyisMd+eUapVVhQDBSihnls/GSHFAY5sNPjzRdgNNVujf6l7xCWB7jL+Enaf222aff5uf
 /FkQ2SR1kvFsBY8XPGNGHEDC7j7P8A5iG40TO5xBt38Wy2G6N6sVQsIUtPWizOQFGtfnMk7FdSg
 hZZZCEYZqRj0a3mRGRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270167

On Fri, 26 Jun 2026 13:26:14 +0200, Konrad Dybcio wrote:
> I would assume it's simply not present (as every SMB2370 is a separate
> physical chip) - perhaps we should just add status = "disabled" in the
> DTSI file and enable the nodes on an as-needed basis

Apologies for the duplicate. My earlier copy of this reply went out with a
misconfigured sender identity from a local mail setup issue. Resending it
cleanly.

I'm not sure if the chip is populated, but I tested whether it enumerates.
With smb2370_l enabled, the SID-11 SPMI device (2-0b on the SPMI-2 bus)
fails to probe:

  spmi spmi-2: pmic_arb_check_chnl_status_v1: 0xb 0x104: transaction failed (0x3)
  pmic-spmi 2-0b: probe with driver pmic-spmi failed with error -5

The SPMI PMIC arbiter can't complete a transaction to SID 0xb, so pmic-spmi
can't read it and the eusb2 repeater doesn't bind pmic@b (only pmic@9 and
pmic@a come up). I keep it disabled.

Defaulting that in smb2370.dtsi would touch the shared file instead of just
this board, so I've left the override here for now. The comment in v3 will
be updated to read:

	/*
	 * smb2370.dtsi enables all three repeaters by default; SID-11
	 * (smb2370_l) does not enumerate on this board, so override it back
	 * to disabled.
	 */

Thanks,
Jason
