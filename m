Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBF3264EB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589094; cv=pass; b=sy4QiqCsLga2tSkkpUP9OJwlqdBJy7nsO21yWFTi1Vxe3xufnTG7UGsqjG9ajSWJXKFT+rLSBSLbB2QvnxUiD03OSDJKFYZ0SbwuUOd0pqNuVAszCstVhCFhBa68sAf344M24MOEoWBxOx4Jgpcw+ptRzkekGquYTfINlCtYrjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589094; c=relaxed/simple;
	bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P/xBBMAKZigGyBOrzlcSMeK8aO7YKYL79fY/T+nq+3KEwk8BHhAF+g8CUn+ruTxzS7miv2mlAEhyJUUaxI6Ze7CA6EYCAvIGRFPe1R6H3ImLdW3F3MuYZgxWO/yVDUir2CmRZZIJaE1lKteORfLmJB/RHC0Vhfc3lT2FzY5bnDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/Ic9GRL; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/Ic9GRL"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963a35acfaaso300880241.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780589092; cv=none;
        d=google.com; s=arc-20240605;
        b=cXKjub//TIBlmhQBYAY5XR2JPc8kzty88E0czHfZNlqCEHE5a3/6BrDASyK5WFUI6X
         uqFxxmiB0t4yRziokYmJQibEKlo+FYOe9i51E2/Ye6WZq8BMrF/v9Kp6aS8DAo8T6P8e
         lPFtDfLHMHnveIQeAgJazSPFEuEeY35+0zFzxoDO0jXBwRo4iyYAoHFnwSht1QbTwmxQ
         mIuUiqId7gZPx+t0yi0fGIBHxdNCwNsgznm5dGlh8Y4wntd3c218cgJOTnDFrdVcb3nr
         UrVEjMWfDPJaBtSlnjrcZ0CLomiW+SF1cfxsySElIXmrFIvj7CJRKt0s91h89H3Q/vKc
         S5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        fh=RMdN6hmd0YyHxoIdXgl3wABPkYXRFw5YmmpABTRUjc4=;
        b=Erh8mPQkOWmV/3wbIz1IiL8Ekvm+aw5cQqV0Ymgf1ANUg/rduOGIE71UdVD4dmXS5E
         gGqfEUbkgapJmJoWs2Zv/1Dyt/AJFkFz2DJW/Sbn+vsY0mwKw9hvSmUbKidhVRGWeTnb
         hYYCGsnkblyHMdQM66EO15YOcUbYbecjs48PwibaVw2T5tvJtw/xMsnySSV9uP30VAtC
         Eht3/VYujBdl11cAYSy+DBOWhYwz/5jfjnrhVCp9WcUPWbRYHoKQaZ0r71zgRYQ2MB2p
         IDFrM5s7aRmg7hVqP2PO4Y3tfknSj2bAJ5Z3dDIv07IunySzH9bMHDPvmYqYp9K35s9R
         v03A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780589092; x=1781193892; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        b=F/Ic9GRLw2ZiDd2BfCsHySJk5k3UegqtdFo4nB0vXjEFjTYFUk8bh2AAjTVYmSdfNV
         tHDXq3oix4wQtkVokOtmjsnb5uuDvZUGfr/Z7ERS3sRfKb0jYZk49LS9xT4m9UU0tL0H
         M7KFgvg3YM5WVKthS78b8O5iSpu4PBsOfcLShNEvAjp07ruXgIhYsl6s6wGsWGry9A/g
         P4dBaQ0iUuC1MMgodcYBFnmnaocFJPrritWvDWBWEiqSKERWLAt9iF3gOpz1k4c959FV
         4WRC1xwWJfbxpR/HwBw6tDMVuZTK2WV3X2M/GV1bbOq7xlW4+kwj/i1CE+WcoMdEWlxA
         CrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589092; x=1781193892;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        b=ANAa7VokNQI1/aGqL9XEpOC9kfGM2Dzf9ZQLMi14WfYVoHzoOLcfvahYsxqtNPJCvn
         c4fR9yTSgZn5RXxUr02+qDMTq04WE7bE9lqaL9uAX1FOWC1h0o1ATbWFVjWA5sBRXYcg
         So1B0v7/JOLo1mvxVWRiVH4VN9w4zSzRzQb6v4mLnnGSx+4UQ0Qalp0UqTYKSayOPi6l
         Voxgok37WgajS4qZCvELmwbxkf51YVYCBEOERBUVk5mjRniuOrVFeGzU8brYkjo9R3eC
         cICFYW5KJfofmNKe/s7or18T+vJ2P0tH6g21hg7Q24QirsFymeM1vL7tZy7H1r7GHvOG
         OiVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8bkLo90fpkQnI8cMfwssrYQnXE7yOitvsEnEofVYfmoXkp37+Wu6SQerPLaz47eX8iThp62bl8rDK@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmxiPre2Hg/RATD40GvMp06wOeAWOIDeYoNDaObCh1bKErI2Q
	aIYyJApljXUrayArd2mNWPhRhIbiwDdFYWxcNHjtpjqiqT5blgi4bhxtADkcqWOu7uU669MI43z
	ocp+KJvkt+z13JHprnTqBO44Nt2H0doY=
X-Gm-Gg: Acq92OEYf2XLlSF6p1DvmhV83F39FofQRlYVwdB4RcUT3py2hLN/r1OygRy9llZ1Zoo
	CLFFq4CGDxKdgpdIg/dg6tGCWPT12K8vbgofGBBLnSgHx35NWh+uNp/Sf+ziOrkUJDUeLLshh76
	fPjq5PpWUYkX27mHur37KLdq1YlZw8arb7kOlUCfLlA8ssnPsVvOx6zAPhKA4timG66J53EfG+E
	jPtRdCRQWaCTJYctimCD7V4xiysr95y1lh1FgsdnE5C/rpC92rQcF4Xn/l0xpybvR3l7hVnrufA
	V+VgGE5eQixAelFG33w=
X-Received: by 2002:a05:6122:829f:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-5a6e8b0d0f6mr4956435e0c.10.1780589091435; Thu, 04 Jun 2026
 09:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 4 Jun 2026 19:04:39 +0300
X-Gm-Features: AVVi8CeP15rSUsk1XI2OXrVWneBp1BIu7jE_glXWnX0Ij_ztSucqY3e24-FT7Rs
Message-ID: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Subject: Old patch version was applied accidently
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, an old version of a patch I sent was applied, presumably since the patch
series title changed between versions (learned for next time).
Can the newest version be picked up?
The patch that was picked up:
https://lore.kernel.org/all/20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com/
The up to date patch:
https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
The difference is only in the name of the compatible (O to zero), and
the updated
compatible in the driver is already applied in next.
I don't want a release to come out with a wrong compatible.

Thanks, Yedaya
