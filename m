Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720D3DA7DF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720329; cv=none; b=NUnTzncHMbfU5xMIiJMOrHe7D82b1cnSUwXchJeuXwLGwojiR375j5gVLhf5ofd1fV5+SfCgkx3MUqRi+IZ8ehdxbuEur/Mb+/drwLuptBb++n9QXmFaNKgqODs4Qd+mADyLVtjLkMEPr0NpERA52cSlwO4uR61eGqJR+d53YA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720329; c=relaxed/simple;
	bh=RIbldL7RmoZJB+4oI+sOM02ju88vpR1QbLJnL5LcQDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujxev5vCDPCH3G0b8ekI+++TQyDulKZSzDKYXoMWfSXZcfC2f5cTv6PmoLKSJemnHQMN6pWe/sRu9dOi7s+/T2HE9F+osGtg4JMvu483LTnQKvQ+BprrwFFmL4+BfnfWzwd5LjevoX2baSVi3eotBpBIPPGzMK1ZkxymLdBomhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYwTTWS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERjcVYxn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYwTTWS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERjcVYxn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TL8fUo942201
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=efWurbXWJr4
	abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=; b=PYwTTWS+7isz+Q6g+ocPGDXm3Ft
	njmIKEc7WNqUhNiYt4yNCxyu4a2OFJWKv8R8kDAkU6K1HxEiEm4K1zRQvgSZu8of
	ETbPPUM3tYNHiE7+cq3QKmWkE2m1DtraX9J2Nmo8RhU29fuX1EvALTxVJxgOiZZR
	DMlLPqbYGNBmNCk/i0t+IQilmhDtTalruYgW0AlCWpU1/qNwW0qEc34yz7k/S8Mb
	Xyd/y2DN0CGd8Oj46td/JjRaLGVgK3QpVl3trArlLzwvS4eGuQZjwunv9Nij0/RP
	CTvvsB3BNLHqQ1IhmNcs/WTnd2VNFvwFb828uN7eF+FLAmtSI+zYD/UPfMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftuhrhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:18:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so1298072585a.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790720324; x=1791325124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=ERjcVYxnU0rzwH9tNZjxel2ZPwY2JB7V+AjCcc6NBW1ccIt1sT3mw6P98bvzOU7WDg
         9Ql1JDfJftzC/v5rkP24w9B5IfOzQ+eU6iI0prPA8CR49usnR+qRmZq/IjrgZNXOnV4d
         1LFMFab4Sizd50IAGeYPQbU+rkCI9IBQZunxioENtAt0FwkuOdy4saT4IS1B0oy5hccG
         gEHxkHDvQaJml4NFgL5zaIs8NKDA6l4FmGxou/fi8G6PcueR96UJgR93eKcHveerdaIv
         Xm0xfaSi3KsXzLawizLcJ7qVsN+B1idv0sC0DhX14rA9nQ0oYYS0ZuPcILowu1x9p6/h
         z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720324; x=1791325124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=rsto6Bshq3BZY+5clchCrN4Hdd47C4wdL7iitMhcjIqg2zfudAqjSDgOL/4YVrJQGV
         PsO5JmJUppLp12YXnjQsXwRTTIqSwT5ElPczqUup+LMSZu52zJp+Jg4h2s2A2mQXrNXa
         1gVct0ig2ZQmv/Rxa0TLyRA06ZjiCjeB/afWaQImXRht0L0dWhesdJfGV3iladqQlTeY
         YoX2pwbUQL1Mit0k1V3LrqZrD7Ab03vUjt/oYc//jTyZyZ9m2cwC4G13r/mSz4PbGGcS
         puSnvEZF40CE+fNv95wF2Vy/o+xtsUPSSqAixNLj575Func9G7WsemK5N6gLi27M9Ghv
         94hw==
X-Forwarded-Encrypted: i=1; AKwUvBx1M4LuUC+OHiHvgT2LfmfeWTFzFpGxK4p0j5GibdeYb4/9/FV2bSemgcyb4FSgzy+IydJMOr73D4oF@vger.kernel.org
X-Gm-Message-State: AFuF++k8FayW2IxJ2PH2+pXaIqv2YXqsMr8AbQ99KiePMRcY2v/1912K
	dHrUESVfvJG0sf48wfKPrcGc+J4FZNQYrgh3dOmBHscY6UNW1/zR3D8VtdcX3Kcy6ffb78Jx8pg
	grMhYwFCb3Qlz7AojLLaFpl/IPHOoTgUilQ8zKNtUaYSr+qjZoZk80YcWXBcAxwyK
X-Gm-Gg: AYBFou0qYXT2YEvcj1eJZyw3Yhw7qs32liBp24oH6zMEqjNyMES9PFdkVH5IWE+ibXc
	8oob2Tub006L4NpSR1r4rrjb2+s03Ya9CjYajCFc3hqSbidR1nTblzNhEkCeYERFaOhs8Zr5bBO
	Q4VR1/CR3S2xmnxVT7xoPtIIyZY9G9aduEJmgM1+pfVjod/93+D3NhXTHm8PrNO9kPmncT9w+NC
	/ZIHVl2BjKM6vFubdo/XV/Yvzo3PFYibb9EE7sbs3LBB6SxJkAEsw2CMfGshV+maDn5OevpjX0x
	9XTG6i3CA258qIfTK3MNZuRVNOrUvJFJGMyoHTq+jYYETjVppvdHYrhMKIXsj69MtCngT1do6xA
	3T2s39bjIggJE
X-Received: by 2002:a05:620a:4484:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ca46833e0mr6334585a.58.1790720323891;
        Tue, 29 Sep 2026 15:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4484:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ca46833e0mr6330185a.58.1790720323446;
        Tue, 29 Sep 2026 15:18:43 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b7csm16981525e9.8.2026.09.29.15.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:18:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Tue, 29 Sep 2026 23:18:21 +0100
Message-ID: <20260929221821.505551-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfXyX0D9K6Hseuy
 WX2gtFnjUeyfkXOra01j1VM7qQZwVzY8LWf3/P8TioQEm9N1sMJe62dqHWJZrBlA1+VVfSJgkZl
 Wgv/NicMLHlRMPLKGzWcFfy7fryehgsVKzsp2Cbxg+n7Pk6hqIUI4URdkLhV5lNp9LvaaTQM180
 p1HTwH831oai7PhUNzRo7l5x3apRAbsoIG/EyYBBoyieVuGcf93Hy2lftQwW04n00bInA+0edLo
 Lge1xIhyTPgfd2EDAc4qKmJFkk2dvK8j77UAe2RS12VQoCZkG25Bpj3/AUM/kznoEDuMfQ/frNl
 cXLU5cyL9Gv5u+TC+YkRSD7NhkoBImeADKCinaMEy3fC2c24NZxXJM+htpMlcBA7H1CdNlroFHQ
 wGF2BYQJ1TEhq1jmagOgPlN0oC/q2UJ6xTAJSudJ/Dj4jAsZr6yb6IcOvieQ9ZYKz5BnzDfrQ7Z
 nShexa6zOIL6WxJmq8A==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abc3944 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX+lOKgCuttmq9
 Ep9bcyq0ANbjmPcspIIZHpJoS1hLM45StPEtZrZGJmaZJIymbgCSbwO4UCZ3UNHgumgCdjrGS/C
 qSk2/GcHt2MVyRAVRHTnxN4BzZhd47M=
X-Proofpoint-GUID: zZ6X6k9sR2XdJzPosikpmXsm0tHwv1YL
X-Proofpoint-ORIG-GUID: zZ6X6k9sR2XdJzPosikpmXsm0tHwv1YL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290088

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 899573674c2e..43e250faea75 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2244,6 +2244,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "lenovo,yoga-slim7x-gen11" },
-- 
2.53.0

