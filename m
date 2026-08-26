Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295E3932C3
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770083; cv=none; b=EReW1YZ1FaJdT6Oog3vfEy1U3tl1h+QV+DhbQblr19E+718OYRn+EqZ4qXVdataUwhv/Hx8l+1VkVRq5uQLPHqn1cgag5kJWpSeEEFt7kK5rbIOdaiK1PWLZqja/2y8NgMGtYULCrgfYp/Ktcpe0Qft0dkv82UVeri8EnW+9Uco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770083; c=relaxed/simple;
	bh=1Hm5k9fnEVwBaXvX+rrl1XNH/vHieND2jPcZRb7RxS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZradYNtb9yBhzeDedOVetN0WgssIFiP1LXK9XQeEQ3NkA0SJ2k9nBzKGCnqPSB8mLrqLYciFQFEpz08I5b083QUUQXmcoSrBoWO3JUYouo4NC7hzVtWoMnLWct1f3tunPuxTWX8MEkjEnWP1u6uTejfwdsv8TizzAj0S8t/lUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JncePQQh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JncePQQh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2529b3139fso133257166b.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770074; x=1788374874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYxeX5UfuTCRGRCYmJDrUw0DxeZXUagnvzMWA/KuGYY=;
        b=JncePQQhLnU98nB52uDJUobQC5sHIuc92Y1gCh4fG8qwE3NuabHpwM4nDrrjEmXP7u
         9cI8OW9W0o2nzSAe6ZcHqf48DEouhOZUXyxarbYoeECxRj75ouOar20IHcKY+NwVi7CO
         f3U18RysXhA7TAwQjEL5sUccXRk31q1eg9s0LxPMOUqsLURaFKmQG8EvFsXUo+mMTsmC
         GUeJbbZ5bubwXBqxEV9cZaFMkKnWLQlb7RpkNuafzYVdCJJVpg6Qmaxgam9SsM+/lA9D
         fKJMZRfc8t8hvD6WIZkRORofevUuwEf6pOC471URppWksLctWplmsRCsUGYWeNBuzhg9
         hGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770074; x=1788374874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYxeX5UfuTCRGRCYmJDrUw0DxeZXUagnvzMWA/KuGYY=;
        b=D+JElQtiaPA8xoIgqFQjTelUNK21rcfaO7Pjq22cdnbAea8ITHerpaHn1zsDX1mKfo
         U5BciQQKC6C6Qq1IUjblfY9Jpyjuto1yii+lBRS7scsgQMe8eAr7rhiFIZaN+G+aiQWx
         YsKN5owzZU12/CYXDSl9qm42gbdWbj/lV38eYml6fyPqsItTvDjLLO/ZIsdPX4VpTdEz
         BJIJzLh2hmanhkBxjJQmrB03znYky8v/l/2oYn05CO12+ev6yBOXOtXLdYbKXbrmnt1e
         2MgRrosffX9bsTEuz0hd7vCd5mwkOTXZfamFOOfuuDzkLLEh/e8Oo2BGq+WO1gDpuVCm
         VbzA==
X-Forwarded-Encrypted: i=1; AHgh+RpUL1Dj+c90/zsvKMAQMMoL9BI0dra0ptHnGMmNvnRletc5wVbrZsSk5IVc66P2Ub+nXIPt5CVjb6iL@vger.kernel.org
X-Gm-Message-State: AFuF++lSKp/1Vi8L0SmlzVtLbfWJRmNAmDnK53UZnxTFarzkiu+IrFQV
	KXLm4V2xUmOsQFsMoyZq4GREsKh1Iqug4oT0pTYgF61Y/e7X4pHVNQyu
X-Gm-Gg: AR+sD11VPlRmPWSn34vPBTfjkxpaKmMfK5AET/LZy95w2yEFmxrgy90I7c9XzlEadM9
	45z/CiIIpKBy4mpRNhmBwdDAXWy78mJb8B3t29fbRTVB+V68pYJLi2dJT6ip1UrhYloVxRBryPE
	OsK6qhgnKP+Nn+6oWgzOekMQUc76sFLlnlanN2c2XqOywW7JEa+cHq1t6NkJRzq+y7n45XYavtG
	wWb8Ch+FLW2oIHS1lbL9eWo9xFHhj0GIjJeVNQ9SXFq2Nr9NLwrS5ZHESMSK/x/WbiCeqznDIzl
	08bkDG7DKu3i8zEAu1fU1a0jcCLHLJ2ST8FUmZs3tCz0njDqwfZ4w8xinkcre2h7I1/wUmBk0o9
	eXyztjxub2TGn5QVstw53wMgjSRYWytdYKOLxQFgDTEohkGcRzJcx6Gh9+GOlw23BGsTFyrAuHJ
	fDGUuhCnkdrF2Ec8kR7MUpcirgh+rpusRfZbnoy3jU5YtBzYvow8sWM+t/6dT/AH7lQJyan8STM
	qvw4in7YQ7Sb7NVEcc2ylNxMzgJRGw+qurPDA==
X-Received: by 2002:a17:907:7249:b0:c21:792:8257 with SMTP id a640c23a62f3a-c250bc37bb2mr1060199866b.15.1787770073799;
        Wed, 26 Aug 2026 11:47:53 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:53 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: lm90: Fix DT channel constraints and reject unsupported channel 2
Date: Wed, 26 Aug 2026 21:47:47 +0300
Message-ID: <20260826184750.4798-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of this patch series is to fix DT channel constrains in the
dt-bindings and inprove the driver to reject unsupported channel 2.

dt-bindings:
Forbid temperature-offset-millicelsius on channel@0 (local sensor).
Rejecting of assigning temperature-offset-millicelsius for channel@0 is
already implemented in the driver.
Reject channel@2 for compatibles that have only one remote sensor.

driver:
If the sensor have only one remote channel, reject a possible unsupported
channel 2 and return an error, similar to miss-assigment of temperature
-offset-millicelsius property to channel@0.

Flaviu Nistor (2):
  dt-bindings: hwmon: national,lm90: Fix channel constraints for
    temperature offset
  hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

 .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
 drivers/hwmon/lm90.c                          |  5 ++++
 2 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.34.1

