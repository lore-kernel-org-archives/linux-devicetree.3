Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8146A5F2
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153998; cv=none; b=hlM9AB0eJy44ixNqo9MD+iq4c6HznlZqturSjywW1ESfMCSVecYwH9GICqSxQsb1KDRzRpZhd5QJZDDuZS//o8WtH7P0BZ9Lbuc7RYuAsOveJopCR1nQrYB5gv34VhBkA0F5S+NoMJsgRglZ55l+Mf0CPT5Ctf56Cy1pPesW4DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153998; c=relaxed/simple;
	bh=XWOJ/i1ritxut7H9K0zmW+82TgFIVjw4t5vcoYvkAR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J558bPFwQpnT77Q86FBOWpUe3mwr4hFRtgSroNHl1J9Bnn2kJDg8N8bbcRuu7lPw2I7SA0R/rUkeYoJ2Jl3B6vSWAhcdPPFDpJ0Nko+WEp16o9Vmvs6UaxoI9DS+5QxKTN06rEN9IlWw9DCnmTSxfeoOQDb3fpMHXQAgCzqYPS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSy/hH91; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSy/hH91"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8fe8e343fso27524165ad.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153997; x=1792758797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWOJ/i1ritxut7H9K0zmW+82TgFIVjw4t5vcoYvkAR8=;
        b=ZSy/hH91lOD8gH7+KU1rvhxFa9B6PiBEpj4CcqRV7mCuw0Z0bmTw7JKRqgngdcM6NW
         1s1LIkD8rccyUkeWjkPxkpTC4KfYpLRKvZp0RsmPc3RbUUc5FxWwuFxvVpOYKtr/AL9q
         sZZq1PK/hBEQm/0BbnGGbCIQNvvh7X+7c8/UeV3SaKsYXFQYG38AHQsoG5rCVDR5CSZh
         zxnIdL3sz2MdF+xnXgOFGGLnJgPkTQsO6a1iFbFWjbQZEz/FsnW16Did0O64TtVxkMtO
         GNmpBAOlS5SEzk0vaLrk3xgfEasWPwGNPxfkZn+T3N6HH5Goj8gUGtd3MIAnpBA6nxi4
         69Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153997; x=1792758797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWOJ/i1ritxut7H9K0zmW+82TgFIVjw4t5vcoYvkAR8=;
        b=sSaK8NL55f+8Jd/tAKC/JVHqPqjnJLYZxbfvML0v2iVjw+1q0gATWBCVQ2HFbRX2Tl
         9/uhKznEfZG5pUQ/H5BU9cTKPj7YiVAtF09btddyj9J3Nv+TdxTWFIodpOIrd0xGNj1T
         X+8/xar1new+t+5uoOTy5rLVYm14LwFkPbLheLgFVoemYimweingkFZUiQvOUzc24+hm
         XDbQsoo4W9EcsW0xpm+87cm0EyDMiG/T4RWf+SsLTRsr/GvIUdjN/lgML+G9R49r08Yp
         cvALHeRSejCdBmAp2PyS7QgYX91T5ntfAW9vZ4DFO63EQxn37Gi5ZA1ah64vY3VnwYgJ
         ov3g==
X-Forwarded-Encrypted: i=1; AKwUvBwSLM/CSW/yQmBrK7ITGy72z60Omz1VR/Yu8V1L0sk895eCYojSQNzcaWkXB+1QKeCIcZe6f5+HtG1n@vger.kernel.org
X-Gm-Message-State: AFq9FYKT99RKNX/IArCwGjpCEidUf2zEt/Wib6JVWma4LV5vFN3Bqc5A
	utCH0wUQavZaBxE91dOUQvcyl+E+dLBXQCbxz92u7D6RcdGi5jvkU/KB
X-Gm-Gg: AYBFou0LAqzP4m45tdvLk2gHaoQgCcVERchJ3eYyPt7eXrUfOhLM5C8p2PjXPjQVVsK
	dgS7jA/0oW0BL3J3r+QdvuSnYpFmNvLbcJGcpQNtKlFB6pP/yc2CxvKADmcmXwF2SZxKT5Wnw5A
	fSt1+5qlyHC49ji3aQEy49OIhf2dkcNjzuK2omB0inLnO9xOON0lqLPKr66f7TKya+Fa++iu3s0
	xTrfvPRn0pledvsVM9At0p29SCr1x2hPnQoLA+dxloRKbA1+zF1Nb/EImknF0z3VFym+G31iOFf
	HaWP578Jr1SghYl8kF7PZfk8d8zWNXe/Rajz3Mr3UBPRqn6SC8ucajXYgumQt9+nroHKE9P/0mB
	+qZ8by0vszH8az5KZnHSY6ifZ6558dl2Z6D/gdZBz4cOr25w17knzbjWeLCuXm+awmGQkhD3GAs
	wfYs6xPS7GDUptOw7PffuAJ5RJ7nZHmKA4ZaqCOmNhqHeZ6Smghigjsl/z+9N93d6oXtgU
X-Received: by 2002:a17:903:476f:b0:2e7:94fb:262 with SMTP id d9443c01a7336-2e842ce2a76mr176597745ad.43.1792153996772;
        Fri, 16 Oct 2026 05:33:16 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804d92sm9361255ad.19.2026.10.16.05.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:33:16 -0700 (PDT)
From: wyibo6109@gmail.com
To: Rob Herring <robh@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Fri, 16 Oct 2026 07:32:46 -0500
Message-ID: <20261016123255.1019102-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015201547.GA2868930-robh@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Rob,

thanks for the review.

On 15/10/2026 15:15, Rob Herring wrote:
> Don't need '|'.

Dropped.

> Wrap lines at 80 char.

Rewrapped, everything now stays within 75 columns.

> As this goes under 'serial' nodes:
>
> serial {

Restored.

v5 follows as a reply to the v4 cover letter.

Best regards,
Yibo
