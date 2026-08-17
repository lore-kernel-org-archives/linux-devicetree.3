Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D81024E4AF
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952303; cv=none; b=Djm1RvVTRGYbk0/9POgrqBj16GPWCBY6nsuAyqsuvuXtyRE6S4kBcLxt3Jx3K90ldhJrlPdDIK2mnYrYHqPGwl80dwbbIsIKNOX1meSwiolox+iry5sDVoK0ecZ19A+L1XaeA9wbrM+ILm4zft77Z1mNfhO/kqNOL8zzbyYAwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952303; c=relaxed/simple;
	bh=5rxYfB6fEA8QV4OQaA+5imSOiEABtOgJH0KumSHC5aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XB2aT0a9VF/YusRDwAdG3OBJuzBdRlhSMshRZJyVXp61H3c+Mard3mLa7NoPzGMZ7uVlSLE+n7W5B1ulmeV7lXU/aRNKDfgHZFFDQuNCD3xsdD9fq47QTojNRATyJKEJ78l8xa7yDBHYbro85RVDB0gm3iTb4MhkVOQl0K6+tbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWRn+Olp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWRn+Olp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so27745215ad.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786952302; x=1787557102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=dWRn+OlpunVkVinjnzpW9m5R/p7RetzqjfrdRiSYwCEE/4+kq5iMk+cvzWArESyvQw
         1cpK8ieqpfYteriU+Mz3aWUm5rXKzCnmIjnYQtMXteHjBNZdWorivK4pM0eHJcPNUo4V
         RWNIQKGay6n6vAGa7kMZdCSarfAkrIdkg2h/DK+RMb+HlqlAZ7PnEieSU3ngOokdDVoT
         RZwD0ElX+o3Kf10A2zJHvIOs0PcMiDYry92lpfNZKXskibUWxJX0gWvZkyK78klktbPw
         jFKcwmr4MWJE0FLxyFBftXyOvoqGInU+lIOUyL9zSzjBRBFFiEhGSP2MhNsAIhlctAop
         aYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952302; x=1787557102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=Tyb4mP8T5qIvmIy2H+RiX6uotQItFRDhaEafQTnQZOou1Otr3H0FnBVSTfXPcG1/zY
         XP8KwVrQ2d5uuj/qgJKbmUc2361rHaPWw903DBBeDWCPbewohsD1FGfJuNNxOeMxQqYv
         3ZWBA/7+/0aKrKEFkXF1WvYXkcMGMsHq7HWMJtO6nQU9qQS6+2LMwsV7daP8YfdefsCi
         PIIgBdgrj8qff8Fl7deYNLBft7SLqk5tpmf5jl0hKwBflb7QbNVrMAJgwsJvaVYFHR6Z
         BY7dbAn5owN2Ez6ylLGvupVWEHrXs/8tnahMMCN5lXvFdMdNZzldlt+OfTA8StDqfSap
         Ehag==
X-Forwarded-Encrypted: i=1; AHgh+Rp70y75MsTeMOtNpjCjfKMsYOwLdG8T/rUMy1f9YOxURSTyrQNxBQ3A7Eg5sCKw9PvhZyXYyER/Jr6m@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHGjTwQnWzm0UFV3cbe4jcfOeNs1IOX0AKakLHPegqVJpNfgM
	vY0yH/7ToC0alFE4LEFastmz9tbvAXaQt13TVyz4UegxVwdoBAdzA29I5AQ5Iw==
X-Gm-Gg: AR+sD13dXuJJVsvdusZMvlmr/Fd+CJED6UyOtgKgEXPWrUHV4K/LoqPzmq+T/AaJ6c5
	KQqbgS3oTuu+0bTu1+VOl536TPrBSyX2XtagYSgiSKvEnkO4ovcqdMbl7YXRxl3pmV7lbh7PiNq
	ntbh+vPESJx6BijiygwnyFlE4iaMn/bu3gmn5TvW+y5j343DvpnP2d97qw+maXiwHZG0h5UArYn
	GnBvN9MYbWPEmHg4PCsLaCSM0icEsORQ9Ll/05AoDE7si3u0Iqjz2sl9ElGlzGYUG7z6JMP94qu
	P1UKa/6R9VWCDAu2S5+aV7baYxlctb/ZpqDGgi7S3LFD/X/7w9VH4xdUK2W++wmbhJpvUIgYo1U
	H+Udo3y/1bKnyKXfTdHoEmklzzmVsanOsGSSsMJ7Khe4EAykqZH2V6hcQokslF4uBbS7L9SP+TP
	DFnPl4ahhQ/UnpnOtmDxKabkZ8w7uvVf6SzLjM9uhBINtUPY3wcH3L6z20olVUa01Rfnq873nFJ
	0EnqHIqK8F8vJu/D3kjDOI=
X-Received: by 2002:a17:903:947:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2d37f5cdb6cmr349627075ad.1.1786952301733;
        Mon, 17 Aug 2026 00:38:21 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267cc91278sm3359088eec.31.2026.08.17.00.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:38:20 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Mon, 17 Aug 2026 07:37:54 +0000
Message-ID: <20260817073755.2087-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817073755.2087-1-sreeshankar0910@gmail.com>
References: <20260817073755.2087-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad..3c1ba5168 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -208,6 +208,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

