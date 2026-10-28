Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793151737;
	b=H3ajHgHkvFuVnNh8y6iD+huaEAEPTJau1F/bjl+HOiIk5/XDwhOwbAILwr2FMHDWyK7Q
	 mGKtUkOMxYTJAmLL+6WULpw3MwtYoG5dRihPrtFp6KA9yLiT/D6udoyhcjuMqE/7ehH/g
	 BLsMBJ3ubc7k48br0gadolWy8URCMr64vOvuMMj3K2JJHvUD0Thi56x10SzfvmR2Qu+It
	 tuZWD2StwYyzKrbp9NUAjOJG5ahhNrsDzArihFD1GONMFZ1AjgKDSsT/8/GI45nkukVUy
	 0cfUJuRpcEuGTq384NJfloLzXK5p7bGSs0RXln+I48HZnENh4/lCYSqGGVp/RQs415A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
	b=dffi3Z/3Tcdkjc8r8O8kAos/MKUkZUMnlPPIMg9zm4ujkZuG6OBKHzRmowvis+NoqB0V
	 iTbx3+zdChDgXAxIM0QvE5gdu0G/fMhFNoj/ZlvmNXzPVnYK8EM+z2zE+ooh9McWXHCcD
	 ++bKFBSSRCJcBla9q5vr1gTC8fIJ431GdkxvNQ/nXK2QT2Zuw0M0xWLwyOnCvRKEqjPKW
	 xozbA7EZWZETXJ7yVB6dil1Og2eXOJNJO3eCe4WXNZsQOMqfwXC8BgnEPTwf3r4PQ4+HZ
	 2ajPlOVA9ITZcFyqZzDdoOW5BtWDNz1TRQT3vxH1e1UKwT74UVWRP4ZA+4EUz6u/rrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42271606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42271606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e93e0d86a0so583515ad.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793151730; x=1793756530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
        b=vZUzLndHuy+VrKIWc8p9M5ErSiqHSTEQkb9wVs99zm6p7KAj9XBh3k3EJ99gprGcZD
         hlu5kMNZsrq1wpEgHoKsjHTnshgWPCuL9yQ95Z2HpDv2ENFjrcbJ3F9SApVkFcXtxQc8
         r6Bv5EqaMce/K2vGnSU2LE25LG6KkUAs3Etqx71TwcdrbSsb8h65TbSqowVvmGyIdsrS
         kR4hgBkWPIADtdHzQu7ywyR3Tpze60Wl0AQOHu6TLljhXzz5HomKsyoCh1N+tURCmw12
         LmSgoPxP2LITXU90NNKTE7VZHx/T4E6aZ3whxPJcGbxDTPNpZXBuZM/QnR12j0d4oXaK
         sdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151730; x=1793756530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
        b=tk251NMjEZslvb6148R8EeGKNlslBBap+aVd2TIGaxdzBSaoNxr9y57koxE6fUjN1z
         rRh6YnDjpW+wlzcY7Hy20s3g/aRrmmkmMwo47HAUyAAkCWy61R4L5ROq/EGjqi+l9Dg9
         fflOvoogvwPtqmGDIDpQoN78Uog8ZrmpZUlKylZY8R8R/oVV6PrWaV7gGRgU4EEnWVgC
         y7kV3GKH/SYzuT18d38Z0NljQ5JyFxVQR86gD1nfbE7pP6a+sXdmmDhbxAp4QGMMc/ML
         UktWCPuCiCUtQd8yfWZCBTFePQVdtg8Z5kBNfPtDBasGqDG8YbNTzAONogcoR3bV+TfM
         Ik7w==
X-Forwarded-Encrypted: i=1; AKwUvBx9daFqUsqW4tQN1/VwMQCqRsL47LEwhlkkFpuYfIZ9POJO2fFarMAloauo8aUuj65MSoRg2+5O4/Vv@vger.kernel.org
X-Gm-Message-State: AFq9FYJYgOJgmb5ZAoBMssu4CXy6lMYGRhAnVvKlUYoQriNhkyO9+NUd
	GxLo5OUKuUPVLi/cJxvMeoTZrUynKYPlpQJCWdSwzLDMs2OU9Zv3jkCR
X-Gm-Gg: AYBFou2ZISnpWV8hrOn3+gw8th9jBkF9fCFxchemXg5WiLrO7CKNepJxyeJAomzpQCh
	cm02WW+EXsrxzp7q+T4UnoV4yBCmCwmVTE1JicnjJ25Jc76oPFjIaGtPlH1O8ipia4faHv0S1Pb
	1yFq9lPlGSHf/9isx1EqWxDhP83ewtBD8vquh7nvvmBfpeUP3WwNMZYYVqldmuwcUulzlVwx9Kn
	yB6ERgUsCH7ECsImbKhFU7xsGvjS0FcXSsPjuKNkm8svEAuGWQ26Gx+x0FULja+lOuVNh5kVuIj
	q1H/FKlIFcCYlhJ2WqY8JvhiXsLH2BFqIUROtzTAXrUxg0JXik0w3P3VbHYSLNXVPUuD5sp3XTK
	+mDacrKl8v8X4O41FrrCO3mlDqooq8++TeVtADyk2IVaIyOZNB4ALEp3+QxommWEbVQfXU2kPp8
	OSXCa7PysYRWLwLw14FS086g4qWvA3l3EcDYN1SbMzE+C8VovMAL4uzm9RJkuBg/n7utyRum7h0
	nVIrYd1WJW2WAiakCa9nGnl+8TdZZSrkW9mUSWrfzcB8O1CQzDxP0nbu7nsFJflWMYZL1pY523Y
	Tt1OAd92P/RArcEKSSwHO/jZ09wC3PlD
X-Received: by 2002:a17:90b:3c8c:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3ae581811b1mr1020251a91.4.1793151730487;
        Tue, 27 Oct 2026 18:42:10 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm544338a91.10.2026.10.27.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:42:10 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Wed, 28 Oct 2026 09:42:01 +0800
Message-ID: <20261028014201.11057-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
References: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Tue, 27 Oct 2026 10:56:44 +0100, Krzysztof Kozlowski wrote:
>Yes, just be sure to capture this in commit msg and maybe Sige7s DTS
>comments.

Thanks, Krzysztof. I'll clarify the hardware design relationship and the
reason for keeping a separate board identity in the v2 commit messages and
Sige7s DTS comments.

Best regards,
Jianfeng
