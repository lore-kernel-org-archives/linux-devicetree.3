Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A85E30C630
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255653; cv=none; b=eAYFKfscaKaAFv0LPdPWoj/R3W9mwd4B3hHYfJm8XzERvh6ExjxlU7p3tabnLRpuUBP/J3+eU3MCOjF+oQeVGSNl/cwmp5Gqlp0hAkRmjmC+VowevEchGZ4S4tgjYWYBOFIRYxP86s1/uvAG/Z16DpsabYX7o2iAieCAuYlSlI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255653; c=relaxed/simple;
	bh=/qTb5D8k5mJijhAYXco0XNumuwHJi4yRgl5gjCxIuIs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jfiXyE1nXXsnYNSvwRj5mzJGzKrpt0F1an1KFy6iQ0rb5U/OydmUn7brmOwHBu7QS/WDwjjbndsLcUNY8MI4rU5ZBANbzdAReEmFVz4GwG7eUk7WT1urPrcwyfIxlzuH9Z7ZEabPKbZ5q7gwCzp833W1AMvU+HGitL+L5tGaxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gkh/xu+U; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gkh/xu+U"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c895e7de52so7457756eec.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255651; x=1775860451; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xp7Dbgf5b3g15NbF7ANO4wBuM9L4b5vcD63pgQCNCTU=;
        b=Gkh/xu+U1WWrUL/cwgkssoUREbl9f+3skQbqChkFiS086roysz3EK22zcwvEg9178a
         a3EI4YLcxqMU6MQEFXxI/JOEdbDkdFa1A6bLsrBuyHYj8G0sD5wj1RPVDOv4Gnk3Zjk4
         poaw37uoZ1q+OVY9+44MakJuVLiNX5IbmwVhvHa09q+3hhA5/4BSK1Yy9PmQYLEwdXvv
         eGSawOfh6yAz7EwZUGEpG2KOfS9MWVq0avaB23dYAEm7NR53OTN7ZBhYnww2me2coGkJ
         DIJxiFSvD0VfOLW+s8LIFGo7Tr+vRZkrnzaQamYF+kYJ94YhAz1p/XFcJHfbOMhCpjYw
         LDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255651; x=1775860451;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp7Dbgf5b3g15NbF7ANO4wBuM9L4b5vcD63pgQCNCTU=;
        b=IA9rg2S4Ipsl9luX3guyFpYzNOkUtHG+EdUQPWP3k/4ddLmuIA8ldIaMQ3CB7GUWbU
         Y0bMZhqfeaE7Ol9xxw2nN4sH+oUfQ/UtfzDoGXWnp5tIIc7h/DU9UrUfkEeyNm6Y4wV4
         vnLe4lgO2Tun6M+mjglotaZfMmkEnkleiuKZnqiMZylQMuxsPISxDrRvBSXFZtXsrbrz
         rlRIa/mU9E1KZipRgfMaSneWQdYtDMUUImQQJoKxO9DJQSBuRVXdblL7CbJH9SQ8PTMl
         Gtfc1tnUT67Rt6CKYE75y2iA1ra4qHyDeO0q2Eg92CPWn8ExOV56ZqBMYxM4zCYfkMPB
         G9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUd6+G7O1daavy8LDSq2A23GujuNuQybMUzmR4ommfFbkyQUDzbke65UGwL/V8LPPkMxil4cJBs6Fla@vger.kernel.org
X-Gm-Message-State: AOJu0YxIXxJxvAS1QTuRHbvj8OuR407cv0r514DjyX12btqj313GcNKa
	PUZMvtsnAGCjzgKkpy5jCMXX7Zn0dK7INhytNMhO3KfLsKCN70Ym90kynsk04Xx0XFy9SHP9uYq
	HpaX1kQ==
X-Received: from dyz21.prod.google.com ([2002:a05:693c:4095:b0:2c8:6bd1:63ba])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1288:b0:2c7:11f2:d081
 with SMTP id 5a478bee46e88-2cbfad9a862mr2379820eec.14.1775255651164; Fri, 03
 Apr 2026 15:34:11 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-1-jthies@google.com>
Subject: [PATCH v1 0/2] Load cros_ec_ucsi from OF and ACPI nodes
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Hey everyone,
I sent these patches up as part of a larger series in late 2025 which
hasn't mergerd. The initial series modified dt-bindings, mfd and usb
subsystems, but had not been reviewed by mfd maintainers. Additionally,
it had not been acked by maintainers all land through one development
tree.

For context, here is the previous series
https://lore.kernel.org/all/20251013203331.398517-1-jthies@google.com/

I've split the series up, this is just the usb and dt-bindings update.
It builds independent from the mfd change.

Given the time since this was previously under review (~oct 2025), I've
cleared the exising review tags. Please take a look and let me know if
you have any questions.

Jameson Thies (2):
  dt-bindings: chrome: Add cros-ec-ucsi compatibility to typec binding
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 +++++++++++++++++--
 2 files changed, 39 insertions(+), 6 deletions(-)


base-commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d
-- 
2.53.0.1213.gd9a14994de-goog

