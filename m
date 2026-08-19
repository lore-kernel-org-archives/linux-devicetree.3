Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D73B42E3
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148844; cv=none; b=LfCxKuMN1x0RTx8VaWbCrB7GYg5c5i7G8CzpbJ6RgXuWASzgCxmpXisQfS8TS4L0NoadDS10CSEgdyk64d0CajXcbTGJxXrHkt3dCLGUy/IsfBgKRoGSEB9Y7X4TRADIt5wMrBK8iah8CCiO1oPFIRBodf1b8kFeno+a+GTwHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148844; c=relaxed/simple;
	bh=cawCpk82JI2d5tbLf4HkTs17ndIithcdWBs3om1fBr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d637Y2ZZTR+DmQoO+Yq6/x3wTYAmfWHgb3+DKLS7RKqToXTklVRSg6YQPPHlFZ1tL8Wy3SH/82IWe5giEdWUqrC1+MFmwgHA0C1MeScuHeortnPgYrFbyl7Oj0L9uTJ7WSbAgMUQ2/gmo2A6uqICLnyalQph6RTeqoF1cxKuZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCCAE9WU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQoGQJXO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCCAE9WU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQoGQJXO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0Qir372683
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wvOXYj83Lj4
	6TcaFpiPYZEYJL5C51YiHceT37foLNcM=; b=ZCCAE9WUlL5dYbyw86mKJzwvwCg
	JqDIcQeVn+ZBKHwBDxsTRQHBRbS7iSqGASTSgixpNfAX7lMk8QptMrIPIm6I9koH
	laDfpYqj6zsfCLduuS8vUV7RZnWG3DPsh9oGRKt9O6SuphNXoj/CmH3ZdAzaCEGb
	Acr5nLiaq5SzT9kaq6zmoLZkcuyyVGZe5XpaFuooLFoWLknHDZaaKTXzE2giRyLe
	apeaxcKKo52Qqko6Qy8/hlpFd2p95S+9uLkP7CFAAn1M6LKoWqscpGiJX7c+WKZ2
	sCFOqbTGS1aISz2ctLuJkfV1LKhiep4INCuWIVQYgOLL10Jo8g5/L9aDLHA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbmxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:14:01 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836ceaba860so2321037b3.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787148841; x=1787753641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvOXYj83Lj46TcaFpiPYZEYJL5C51YiHceT37foLNcM=;
        b=MQoGQJXOCKM0NVUh9cl31BRgngH+IlRcoTPrboD2Le+vYX4Jd5JoGpCH52ZOuScF40
         hWgK2zjHRAIt3T9kjT08XhkA+XJK5QUP9930BBYkAZrzEMMJOS04ZX1U6RaG5PeUK1Lu
         sGoxQBVXWMU3e+cAnzTcVBaCDuDrz6AMvR8UeAjpUHbC4hVpMj/7HV+1gZjNkU2vGiG5
         W4WSsgN3Ln4LJ0epzUl/WLR9Fw5/sz5JQ42F9GFk7kLZRTlv+J1yv49qwnIceHeKDmd7
         E1hst7G/g8JvAAN1rttTXo+xqDSp2oyrhYAPG/dztE3isuPPRNu5f3N7MSJS/h0FdyTb
         YyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148841; x=1787753641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvOXYj83Lj46TcaFpiPYZEYJL5C51YiHceT37foLNcM=;
        b=jVdtB5CrSvPAYmGExkmj+TyrUk+zgqma51LDP8yt9LsWpLA8HnCT7QkV+mxJRLSuZ2
         Wvd7WssD5rBsmriRJMdjTNvlDcTcmQLRJ6lwed2dWvSVUTZzdOq3R5cmZGV6sK2F+1WE
         uqlLuZ38NtboMKgdzt9+Fue4F8vb5Av9GQoc1kNPR5irj8Td5Ilgz83ow8GSZ4KrScFd
         YWom8HbNNLKwYf8zKxtMxJtNkQQY2hkIyNfLrbXL5qDYhRUN+pVKNtQAjw5X9g1OB6u9
         EvOagZuQDfmTOkI8NuJ7Yc6iGwJygeLD4YA5r8T5ZaCjVoUdAP424hbaNxUJFqDQtFIK
         9W0A==
X-Forwarded-Encrypted: i=1; AHgh+RpUWEqIr2uInjdRM9qsz+7/UEuVTmf96CP27oVPNK7N3RvygnMi/2S/r5oYxmR0AWIEwbO7+r1P1YU1@vger.kernel.org
X-Gm-Message-State: AFuF++nateWuRYc52yqesgngkA7Qa/5EN40RkPoUDtAK2Zn1POvBHq76
	S6bBu/mVqKIbiZ9ziNaW10CklSePaWATjcXQiMD2/SqpvEjw/j9lxGD1HgaGhn7xXx7DBRjgw6X
	pRR7eSctwaqNf5jxjxgfl0IMR9QOUVpgLLVAA7WCuXAcjpLBsa010sqZ7dF18ZhhL
X-Gm-Gg: AR+sD13cZNUkRt2Iz85bsCBf9/WBM/3gDNiIaC+U+G3OysB0DAm7COzgbV4LVLK3GOz
	UVB+09HlzibAxAe/VI3sFGzeVg+0zFGCj9Xm3jXCia7nGP9dmdUzvEWeCHah2rj+VC70mfs57tz
	jzIQEImWrb35Ryp/RG5YP08UZz1JkQ/pD2AiMj5URAxgga/ZeINhfS1c4pFFJBVTL0ASOeYmPPf
	yh0DOrIFNyhz/SmJx7tjW0Qgs7ijvqoTUAj5D4IJ4gz3CsVwuTNUs4t4lnBFiNjk8V0FQv1dL0M
	9z6XWbG+4VfKYOhsgpQ4IQFnP7CkSEwBU0EtOWN68JcabuYFJgQfewr7O1IKCrSNdwqxYmka//D
	UpE3xEemxZ9STx8KSI0fgsuR9kqX9eWlk8kanb8L739uatlqU7Xo=
X-Received: by 2002:a05:690c:45c9:b0:81f:45f0:21d7 with SMTP id 00721157ae682-844da3846b1mr19050627b3.0.1787148841167;
        Wed, 19 Aug 2026 07:14:01 -0700 (PDT)
X-Received: by 2002:a05:690c:45c9:b0:81f:45f0:21d7 with SMTP id 00721157ae682-844da3846b1mr19050377b3.0.1787148840727;
        Wed, 19 Aug 2026 07:14:00 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845184cbe7bsm9254307b3.35.2026.08.19.07.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:14:00 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 19 Aug 2026 19:43:53 +0530
Message-Id: <20260819141353.96467-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
References: <c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com> <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: stMnD824CkQXWm3-VZt4tZNsSNK2rNWq
X-Proofpoint-ORIG-GUID: stMnD824CkQXWm3-VZt4tZNsSNK2rNWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfX2ZVAbAO8XFY9
 P0CRKY10Ly9dqL5514krZjD8FRB6NpZAg/yPKJcQKyU+R+2I0DnJBLBE+6DC5SACKhEO6dAe22T
 KjidAGwJ5PB5jiYyAw4jbKfdDMCmjr58tCUv+WdYEGI0/IITY7ncI9+h1tjeANgNYeWkXCV96QA
 uXQebfOkypR8C8+WA29HoJkxt6PpsqhrVhJTiPVyJ4+vrfRZikfH3dAsWPqO/IXZ4sK50/lpIfg
 Hzzcb8/cD0Ber2pgJILIiFVgUQDu58rVUQZBWD5lN9Axdpc9z8vTM0sgpT64mo/FRgWG+Ak8tyn
 3MeIYQH+bSjrv6e30GxILu88prwy5clBmixffSG3rAxw6tny3991ZZP+gMR17WCDi8UUU1xBgIk
 s4WJsKj6lgh3wzsiIBr1ZZINqRkhRXDKyF+BPY0dxSrnvhmpCY2rCpVz6c58PgMm5WLHYl2+83e
 aRG69jeV4k5i7P9I+Hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfX1X+Ctv9qpIQY
 bblmdiBOLmWyKmv7xhMKChLfKN/fdk8+AyUYybybbuFYr3zdvmzDGtTIcb5qCJd8DT09JglhdCk
 6RbHzpP05D0sH36iol41M9wju+cVHGg=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85ba29 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Gqtswv3hQ5fxRrJH0_cA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190111

On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
> Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.

After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx has a
soldered WCN6855 and no M.2 Key E connector, but the pending series [1]
uses of_graph_is_present() to detect whether an M.2 connector is present.
Since of_graph_is_present() only checks for a 'port' child node, the empty
anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 pwrseq
path on all monaco boards.

v3 moves the port/endpoint nodes back to monaco-evk.dts. Please review.

[1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com/

-- 
Best Regards,
Wei Deng
