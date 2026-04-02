Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A233A2566
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117504; cv=none; b=SHd1+vAmfwoN88Qf9Z/Q2FbKJOqYGmSfzdJ6KrCOroXdXZ4XU0g1DRzv6Q1yHpytjXTHNpl715TSYqSn8Pd79F1zDV3semDHMNlKP9VjYUDwG9ADGm9+FR5CCBrBezZOc+RDv7O5UG+BHgci3qZ3i8V+ZRqa07TP0txX7Q/XTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117504; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2csBW8xAtNOf2xqzj5GMWbtYwSnKmg9Na1d51LRTknH+bMq6p4xgC3AFMjT11bKcOTNouR2w9V2oqZR3BRba5YvVJilJXoFtsylj0tg1+lFizRDTZ4U4suNtpb+AjWMgm5yHT+DNfzb2n00YUBCMJ/5UdjMbjwcUUElXEraB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2+HEmJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkPkdTXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2+HEmJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkPkdTXs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326oj0e3955886
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=S2+HEmJ3crj0wV11XDg2YgQvH18
	a02FPNaTVFkTDaGhtLm4FWUPs3Nbt7ANG7Hkh1PJDZF5AoK4AcDPQinGI7LYvZOh
	Cw/SytMcQZtiaYuTxanDCGCaibH69gLTwZOO0rNCjwOiKiHi8UucFWOMAXhkcMm5
	Bsy28+ZhrIjSXb1hyDG7uZdmZlaZAjCV2B8PvzRMNzjTL6t49fBttl2svAOTCLVW
	edkJBYXnz94tJeD0lI//5WF77q+5i/a/dmeHKA1LC/suuO4a/1ATBoYcyKWdm8SF
	o5ppAWx5uuYaWrFmw7koQ+RxeRMJKv8XCXhaTtJuJpD8Ttm3JN7hWwpwHbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5j4st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso171452885a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117493; x=1775722293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=SkPkdTXsRsBIsiUJn74uHNoSYimewlGu1IFheNZgq3SBDXK3nvXVijHDUlvnL+O2mv
         ZphzAGpVlv6Tjun3k49MPq5skQVK1OOjtUbqL9U2eaxWfuj3Hq4wjWpm10w5X+/ATAaa
         rsUN2G6HFCx8E4QeOBk6d36FiDM2buSTH98I9Y5b8VcPDyNTCgsokWIJHa9wUTRm181L
         Q7ohXy/bkZbXplBKZHzkPiOqDhcXde20Zevnuv4fxwmcZ6trRNS8wpsSqRdsRY2Sczi3
         EMvaHaDxsBoNZfsXEGAif7i3EZgAHq+DEcrWeypfRmb1EYvK6NrdQTzUqbFSFLpqcSvN
         ex1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117493; x=1775722293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=RLyKhhA5XC0HCUII1IgqFFfxBejbuXLUq0ReK+2NBpuXAF33q+it4M0q73eGhBQwJx
         AYPtEbKcQ9J5vEqhxf2FCzlI/TpvZ1k0FiO3m6D1tPSOZS1TKa+p8F1CIJ6EdtT7zo4l
         isOb3BA/gvqpT2APvkSjrGB7L4tnOVC79JIAmFS2bL58PjKrZIlDS/NvWapXg1Qt2bb5
         ZNLqwEKoZKp3+IjjaJTijf//nSh+7RvO6ObS490VDdxPZqho1L8Q6TED+kH8Nl7dAb+7
         EEFUMuOs1fMkAUq7Hw9GFsZZqCe1VMZ0Ys9j78vI9r9/UE2pIfgGwlaUOYWvrhjHnCBP
         trRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqx17X/H6R9kTGS/YAOGB+68BAIj3mZaRfHvtztMu+4TjMeHKbI8MGm2HPWoFJ9o5GaSFkBORvDSC3@vger.kernel.org
X-Gm-Message-State: AOJu0YxQBsmNJFLh4DU9x2edVaqeFPLTwmU0Ispi0fxblJqwZAux7eQg
	udiIi/W/GyGyso4k237We7aPm5x5+j1A2u/8qRWWDJeJq8bPB70pvBXMC7OoqB41tG29/wGKHbd
	/blTH3RWlIppLihKoHtELfSfM1x5bA8hto+pd5p0/SwBSadL3ktUJnMlLPQd0qPJ8
X-Gm-Gg: ATEYQzz+owCCsIonu2T8LlnTAlKYlSxzeQd6BlpUjz+ftXXOrtrZ9iOdJmcPo2EmSnM
	wMXjQMCrdKTBB0E09TJc1WO53GX7YywtuP0w2cJ0kE91uepp+swk13fL+fkIE4hamDwBY5xGnmA
	ieHWG3MkllQQyBbkoBC5q/1doHu6xqZTJ3XGjrMfFQ9qcHiUATp5xWOCLHtnh7t7EZCHuVhMKC0
	qFMyeQPRnEhBU4w738Bcu05MvFbNgmvkHs0rAlI/nFkgdgm5rL8ojX0SK6Gfy/FKrt9FiXDLIG9
	wmM2Kz5jIr2PhnC8w0fP9d1a9RRigh1eQW5lxLy3YluYhphLLbisyRymDBz7FK1iv09GrC0DZod
	yg9KKqxr32nx3xqtLuwueZlvb1EiVmFoEFOv/LSwIa/hF/CiuMDs2ELo=
X-Received: by 2002:a05:620a:44cc:b0:8cf:d804:4569 with SMTP id af79cd13be357-8d1b5af1029mr968085485a.23.1775117492956;
        Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:44cc:b0:8cf:d804:4569 with SMTP id af79cd13be357-8d1b5af1029mr968082085a.23.1775117492486;
        Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v9 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Thu,  2 Apr 2026 08:11:08 +0000
Message-ID: <20260402081118.348071-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce24b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Pi0mzwJJeHswBQwGhgd-N-oLyV9Og1qj
X-Proofpoint-ORIG-GUID: Pi0mzwJJeHswBQwGhgd-N-oLyV9Og1qj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXz4AzRw73TxOB
 tgW5hAJKmmvRXxUd6hmbvlri+GGaXcbTjLGxoLUmCd78G+t84SflttrETp20Y0iDpyIY4Kt1mI0
 bNSBb8CIr/3VEk6oscfpna7ZzN9wAMldlGew/lQYgNY03SjYhSV+A1OzG3B39Wyp0Z8mJw4SzFA
 1iLxGAS+iyLK2WifRiVlE/lhJytwfBFWsxP7S4ufRypFxAn9tT5LPr0Cof8Rino6x9aOKQM+O7F
 t8K/Wt8VVxDM27YR7y17RECKW0ISgS6HNCepsSQUiMwFI1ak+3KsUCLcwXnI89xlV39wA3DJnvQ
 Fij3CDYfhBznHK9ECTVYB6S8gXjJyVbLve0Np5lfK8gS4KRJrRpCCiV3RYOCr8egaglUN1/0s3q
 jqQjvZwse2wvi3JRvcdMtpHgR0P33/JS9wAUjOSmRKzBhKXuZ7iPtjfgz0W0FFV6g2hORiFZvWX
 4hUjMrqaRt9JJEuejcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3

