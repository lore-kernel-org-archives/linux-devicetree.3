Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A753AA182
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162534; cv=none; b=ZI1MixVpr5vCvmNbstEok7GLHSWdCZGuLUsYZ41c3KDkFvk/Lv8VUA/aLjIgJtdyiK+DrjQW3ON5j0TcPs8cmOIK+aFJ6rWAtfAjI/8vcgP0fYjYxXGjYVgGLiib5HJjQLxdnDag/VxKmNpX/aYt4X7xhhoORSvK6jbYSw7rq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162534; c=relaxed/simple;
	bh=cmszwX0Ji3XjQt7Fpy6t/qmhlzCiNP9RsFnOxecQxzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpCoHgL/dtHUbla8xCsEyI1mbUUCl8jbCOJFP0FxTo7a2jVXEUYNP2SGrgGkTdgqpI7zmpFB0M6b6vB5ifAoWYU+tA2MWoWcKVMkaYXRt+76leepf9S9pAjmu62faz1sWbVobcn3257dHOQNJb+neztu6ykkEe0N+38X0Zb3F1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mixc5be2; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mixc5be2"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9155104b721so6720485a.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162532; x=1780767332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=mixc5be2xTfwH1UyOJalDT76LBw+tJOy82UVwaizW0wT0tv9pWWEHJawegs2jHnSBD
         kOXwHEHOiW0z+64N77NsGUV3d9Yr67NIyEes874C4aD7mB6IEi4xD0zwUBiTF6qcx+AZ
         kSKH+AtLm/wpCVJpgk8ZHvNG9Uhh9jI/aUYd0p4c8LXhR3g+htffO1lN2PgKXlwEIwiE
         Z7qZ78GPt0CxC3mO5rkTm1Ug4mV3F2OfdmFIgoMFguBvHr8sUvMZbc1UJpywHo4OQdL1
         aqKoDkV1vKyUSQqrbqbLtL8gnmOTTjxVDDd9jeShsc9tIxvtvgJU/PUV5KQkmPwwE8Yn
         /IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162532; x=1780767332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=L9RR693JOMvbS7/A1vUsJR+PlJQ/UnbKOQFzPEK5EDsTRyC8G9lV0SoNpXrctO/yMs
         eFm4Y8k5OAuOb3MnWn6QXHofDo745iQPdgMmeR20ySCsj17g1GbeLU1yoNYRMkfaTd8v
         2eMUiyR+cEUVmbzE6mIwn8l4Asnm/+MisUxqZBlrENQ5iBVoV2kcdfHqF4lAO8KxDHH9
         ImyIQgRN+b6y1hNEHfbXwbpAG1aXpETXn5/1mqfLDXKIFnvd4vlIeaa1hKAgmEG7hkRR
         liJ9mMgx/D34hxOSw6TvxbYpI99ro21OuPdGVpZGqU3IAL5o6QkiI/adEFYdFQ/5MK/V
         5Q4g==
X-Forwarded-Encrypted: i=1; AFNElJ9QmBB5xMhQtY/M2UOYUPz32xO6rGkr81c3gm4MrRpShr7aHPffQD9pQQe57pGt9PTSpptfW56WCf4M@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAP7kR03QRjMAKLNV+GLCaZFbP5lBbLjG8MjIq5D9EuMOU9P3
	YYZLcuG8+y4sVzrXaZczsmqxgyMWnHBRvkFefnapSUcGjyh9BVpA1BoO
X-Gm-Gg: Acq92OGZpB4InvhdmSkcAd9xu5kZnVl4/y5HPMwlBi0HO2WUjdrNctATeQNzCJ/Dhj8
	PAwD/D4ghp+vQGht+58GfrSMA/EHczUk6JI1xhHq8jUoh2d7PbGRzDa0ZFy0t3QdHaV9WV2eA5a
	M9AtgrSDmt2wJI6WlkZEzzIKSUbD2naNyIi4f9j3spmkkxnCEB52EdUNYDmEQlTIZf/X7krsAzO
	G7on5Y2sXV0JI172fmF+a0GV1/O3suck+H6EyVcK/qEZ3hD7jY1H9U//dWWqWNlsPSyYXiQHIBI
	H38e7SYWkdjYyDqwl0+pGPR45m/C2yD3AYWBsPf8I4Z/Ef9vxUdbsP/SS7AfZaaJdGV5mf/c8f/
	cb2xRyKjTIfKfQiHdV8Nr9AT57wWELh1L21sSzx8ZE38Gnk6Fyf/eU2g3PsTm+fwTlrYfiaesN8
	sLq9kUfmIXwS48MJEUDlf9ZVExp6bj3pMjs7h6LI597uoR1FIWK7Su527LEuwnm0lzTQE=
X-Received: by 2002:a05:620a:4510:b0:911:8e3c:f165 with SMTP id af79cd13be357-9153d99ebdbmr687805885a.19.1780162532103;
        Sat, 30 May 2026 10:35:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:31 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Sat, 30 May 2026 13:33:45 -0400
Message-ID: <20260530173347.33533-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0

