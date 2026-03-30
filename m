Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC23A7842
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858901; cv=none; b=n2ycQywfc8jbqRvT9RXGgO2aahpOczgWkSGdB3UHRtsVUvf+Z7tOPLxeYmnaC+T3VtVwYQmUdO9rAYYnYFroNEt3w0oUt2yXGl2+KM6c5CpzdiRQHDKCSyiDALSXbq33NhKNRANq5c4YyrmuE7z6mY3zFNt+TPQLDMfvVIOosxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858901; c=relaxed/simple;
	bh=BssiN8tl0qU1iQXG8+lB5lBZKyz1PiocGJtwp+eWGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrrbfd0GCmlAUvo/wxKwR8oNVbrifQrzZWrci1EFuw8qkoO9J8MraJgQL6McAXLvUsoE8wUHx1Lk1uw/2e5Y54NEhtVApMymN+KUe3k8wGHFuDpJ5ZOEtzjaKyDPHfAbvVQabRt2W5CcvHj3T58K0GPmfYYYsFKazffbJfRn/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4PbbO4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXrpcbcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4PbbO4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXrpcbcd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7KTG81224545
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eSDnacEmZXI
	09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=; b=S4PbbO4amhIVk0MU668ofluRjRu
	BnIk6RoHSZWFrF0RjJ2k8e+mBM70fnL64uTC1bDlgZudW9UQopH5EVG0pByj7TPa
	O7xAr9f58gzKLyQlNtpPCt8XgZXUmgD46nYaxKen5x/O0k8y9DbtmbCWszJgynHH
	PQKVZlvadTeWvxZ+XOy/BRBoqZqXlX4Uu9l4ZAsgCv6qYsa9epIFpN5UHAhArAuV
	rdXBn6EJy102IoE0hF0CnPGigECI2MgE1KlsPSYg7a3qh6EaB9VBXOs/7sKbpzUo
	xkxchu50O+S2kOkswhqiCc8MDKTXE4CXnqskFrSndyrmsFuZAXja/67O13A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pddh04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso156994341cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858899; x=1775463699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=cXrpcbcd/Aeg57NorRxGviXiIzyX54NhQvzli4vxMoYz2462fn5Qf5V8yAC/KJXThr
         dVASP9+s+qWXxR6isJMs9lLEqkyxmOsgjl8BikWwWSmH3R602QDZkp+eiOSQqMsQKfaL
         spb0x3GVVX9tuOi+P+EnZsUsbvTpb6GqyAS10WunXuG2TL+CIgnlcK7MxIF5albNrOC2
         7fwascp2XAlMfSs1/PRUGOLZK96EocL3YW0oqK6TAgN86Nfhq+bvQigUz0eMTdpeRgzr
         m0ZpuG9gG4QFyPs3v2D/lbWiI2cMlzf6dmOCj7yJUPqycDQdbH+zSwjMS/gn75LB6wbN
         bDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858899; x=1775463699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=JOrId1LPwWYK48etehleWsUsRW+0u6Cmu2IOgtFq2FJ4Xn0FFL4469xcmJ1Rejndmq
         YFkiHfCXEDr7nYVhBHLkxcDaOzrEnMBFPJnlxhT7e6pE1w4LNWCLBzvlD42h4/h4yMau
         ukqslM80Jq7JG4dY2rhDWRyvIUgL/RQPDFJID6kaEJVWXTOwrBlCWyjpxi7X7D++r69q
         8sYeBNQedkuOAHWF/j8rX+arLpL3CR1YJj9pT32Q6CQd1uTkwsL5mv0AJKZw7vcAE+cF
         bmpES/Wc2bahHl3PzGT9t5ppbvymQkqJGZiUY1GpA7Ch5Zucs76kfs9oncezUALdccbt
         MQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe41qKCeq3qT9L8AJ6jAJ2yg7OzJeKemOwYd2JHfrYWSyJtkywNIwVXGJqhw/LdMLAmqfnW2mPKaJs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nqFucFJgxvKzCb2dTixp3GMjqdp3tICxAa8HqqrJi3MnymtU
	p1s4E0dDsrxkwdbZxcTHs9GWLzSBwIPnujflFSeLskQaE7ga2aJhKBhw6iAN5li9psEXmDsERwH
	nfJ/60YhxmdQbx5IOp/YzN/hlO24EagQ/AFp/Q8NWjIPer8uhMF14XLXyuU0U3/pM
X-Gm-Gg: ATEYQzy0nNDL+68FSC6Cd6+YJGrDfNTNLNt1+O/znQFTsWG0uP02PTkTf/jq1nrFqkK
	h5kBzpDqY8eIB1iOjj1gWJZWBSCLNjWBtpZJrTW6q8O+cQm3BKnPMdG6FYuJ+pcYbKUjkVHPzAY
	QwHZQ8KufrnD7H8gSAYprBwfgtNkKFfKReFVbQ1HCLhBIOqHrEZbbx0fVwmi8OF7HmnFu694XBZ
	tMHq4gLWloy72aYwW6Hf1oGSIo++2MGFELID0lwXra3lVYxpPxl/qEBOl0MtqKUZdErKPOs6xwb
	3HKXJ3NF6jZtUEjr78X4lRrM77HrVSRuHszkhxhVdU8muIKBM1HFK0AiIYNSThS8jeXLB8jzQZG
	LUFH8nhPMEgcs30+aeD6l51dGEC23nAGiH9ZJvr8hDDr0IPaLCQlZ6J4=
X-Received: by 2002:a05:622a:53:b0:50b:2eee:4b3c with SMTP id d75a77b69052e-50ba37d1909mr165999751cf.15.1774858898707;
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
X-Received: by 2002:a05:622a:53:b0:50b:2eee:4b3c with SMTP id d75a77b69052e-50ba37d1909mr165999531cf.15.1774858898299;
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v8 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 30 Mar 2026 08:20:54 +0000
Message-ID: <20260330082105.278055-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o8luC6AS3s2xjXz2X4HRTS9VGOoRnE37
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69ca3293 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WbEMVPVtDBSXEMPt_8MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: o8luC6AS3s2xjXz2X4HRTS9VGOoRnE37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXyom5WJe0m+jt
 CiS2cd53r6ZwiFbpBFY276Q410bSpcXEzcuB32qFQjFpL1BmLkGT/ADHsAuirIUpwStYbbwJ87w
 dErEHW8J18lg6yrzRm8N43X12WoYu4n0OX0DvVeOJ8ncl+9UuUu81/tPvakENd0Ps6RsVIjDP7P
 LvZt/UIUNzMn9NmfrGk4RjRZ5wa41tfMbkto9+Dr7jtDqzV/T1zNNPmi97W4153/CoYcpZCbcaW
 soQA3JGi6XqgtZDlhGRl7gfVbjtkUjgnRAJ8FF2jP+H2PCeEUCMP3PB9DW44bSZfTzqq0Qp/aRQ
 XdvNRH1N95aQ5N0KxNr2UUoh+vmTwiNTq8c8HiXpNe8z2ifdVkol+3Qo7qhPVEwUCbnGKXRm+bG
 VaT6bY55kdIseiAagEunkk3RqCiCthf71dlQu/GGG3g63svqXEWDzIEd9oMvZsd2BUXHVhGyUof
 pA5p2JirFOpx7Sun3gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by depopulating them in remove callback.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 069048db5367..2dc525c8be42 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -762,6 +762,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }
 
-- 
2.47.3

