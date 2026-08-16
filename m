Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F7189B84
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867951; cv=none; b=AA2X4tjH5IqZRabVVj9me4UTTWC3URCuTQx9rMs7YKnnf4tKNzMYpN+d9Ht0YShjUj8xG7qR5tpQ4KY7zOEL5PvqR+hjSL4CZCVR7OOndZB2uMZM5rAvBu9OyOjWeUAKjABFbMMycp1VaU3wQLxI+fwOwDpcfhyvDeVMdQNQEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867951; c=relaxed/simple;
	bh=kUEfs1GTUSAsCblsYMy5HE6hfhWD4jASj6qcD9GRLHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZlHDadyxCKV6xorcAb5WorWBFD2fhmsLG3NsCy2muTV3P2PTw126t/8v191WGvi0PQEF8ez9K3l52CQADzZn11m0GUWkDWAJfLFzEOpwBSbpRFRZP55PYIqTFXfzuHarU9n03r0oHzFq+Q1aZMYS99TZaWk9DiH05lT355rMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmH6Qkxi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmH6Qkxi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacf197759so34656805ad.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867949; x=1787472749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoBVT1Z9eZgY9CeoVlJHulg/Kfbf64+fh3GichmsKc0=;
        b=XmH6Qkxi/0LFYlRje+UYsQQO3/e9g7Ll6zXvbISkoQuFQP5zO0fJFWJZV1dlw/OWFY
         aDDkAj/70UdCMfZgR4aG89ZXlf7BKBnxQq8OzyBwrZLkQ4WGrwKGyOWIMHBsEjMPO+92
         NXfZ6jJQecYnv7JRn37mZ2v3q/NY7IaThN6nGniOyXZ9KKRZVipaFDZJIylgWq7ndwif
         11G1B3jSgYnBZqfzYWEKzjqki66MKRpW288U3JtYBW4dGRWb4cHhj3iAIrSE1vOuRrK6
         o5MO7+hyvRn6iUZMG8s/XAnKu/dnSYiockImnGLK1yAUsOwlNds7IU8weXD+9gj6hpqZ
         OSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867949; x=1787472749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoBVT1Z9eZgY9CeoVlJHulg/Kfbf64+fh3GichmsKc0=;
        b=WJwkSqjMhRFaDEiqhmUh+/b+o0lFukQQ0Skg5dPE2MVh4f0D5Lr3OLl9ZgJN5hguhe
         SU0Yaai4gJ7ubXyhSUgXtnQmBXmBJxzBx+5nEF9HoZGpka3vhcX17zZNf+YuWgwtQA/4
         6nf8EXdWPTPgATA4/5LuqrqpZTa7rdG+xlik66lAsOBhXPs9L1vqo9O3DH79USa14q/z
         846YHmX3v5scHCUU+ZlByMeICS3L6QIojCE05+G5TYKqOZtr25P6F1arO8cL/e0VzYbX
         gGb+ywNC9lzVOzBWIkfE0rUUDeSeBxBq9vdhrXrutUEq38XH0smd1ZvoJjp5qnpHAozk
         JDVg==
X-Forwarded-Encrypted: i=1; AHgh+RqpWddh5iPa/YXbL9F227G6cV+6z1Q/UlxWePc8JAOllOS7pe5s54o5j7+EeGeFLVVSqf+04A5eCcQL@vger.kernel.org
X-Gm-Message-State: AOJu0YwIR5OPmHyH2ZqL607vhV+xbxRCs1jEsuws698z0eC7TuG4z4Yx
	VtkR9wMdAxKdUFJt9reSqQDOwzYteUcSxWXgWztHsaWl0QqlTJGWScCa
X-Gm-Gg: AR+sD13dnoO9jbN7vhx3YoAx70GZeVAPhECj3m8ak5GTtM/k75Su0JoDO4QWa2DtpKE
	oYkNL9RAUi+2k3kMSV8n3dgBGFQDWJnXPjcJRpb/jncv1zKBn918PrRA99NMeCGgWwaCICtS2R1
	k8lT6pI3Xyf89JjZnU12ln+E9Dd1HT818ciANC9FZQ2Sj71kcpegHk6KUbEqY2gz+3AiyLIIlig
	qc8KoJwKgjst3VLAKFN5sgzt9p77nYgp0dwR9qh627mPCzFnZOP9/8TFKM4Gho6mtqnRRzdJEs5
	jCThqImv4VJo+KP0zQ0f1fcHjL+JEa8inRjaI0syc3H3zKnOPF09ChmkwHwXXgR9fAbMwHt6AaV
	/eUZRoQW/9DP3rB9fb1f6wHrWyjY+Akn8B4LyqXq8TA1lfOlm5l2dAwH+1O+yiXpE7um/Y0EtGY
	zEID360GJ5Wa3lW6OMjuUTPv1ZlOX2rrhVNfbJoa+1BTA0umN1oc7OzCTR92iEx+2omug0Q9bsp
	vCqHoHWUJjK
X-Received: by 2002:a05:6a20:918c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cc71c61e5dmr18863541637.22.1786867949337;
        Sun, 16 Aug 2026 01:12:29 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm23716838eec.28.2026.08.16.01.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:12:28 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add Qualcomm SM7250 SoC ID
Date: Sun, 16 Aug 2026 08:12:11 +0000
Message-ID: <20260816081213.5495-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 SoC is known as lito.
This patchset add SM7250 SoC ID.

Sreeshankar K (2):
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

