Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC763A5E7D
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414913; cv=none; b=JDiPtD6YHmIQR5Mn6ZD34ueK2Dd0F/w6F594hXQNFh0T5yB7dRCuO9DAV7FGcjlkyTKZ/VtAO/m9DCYw5fTT8kqlaqdqJkRWFiW+zASKlz2zjwSwv2ynN2NKCERDTK3jik8MsiOqwjTp2eQmhM5GjtRdJIHoR8FaX4UzlNl0vWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414913; c=relaxed/simple;
	bh=o5Ux2irjn8CnbdS0GzElZsQZ2UL8xMm7/EvCYiFy3L0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeJMcftOSWoHwv4jPW/8inVCI+31NYs9w8SFZzMCH+m+CFmCDQk2QGOc+e/KcQfyzNUa9QdfJMQhxlhmSGauo1d5hgOVldUV7u62zCgXtj2VqXUxhxGV9ScAvBin+qpDIjZEEwCEgd3p++BDEfoNLWFCSj3FUrK7Yp4VPkKx4Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnNRalzA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnNRalzA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so988455e9.1
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790414910; x=1791019710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sASaYvsZRpd1tn0RL89dSce6GPhVNOMoBLXnwjXq9w=;
        b=RnNRalzA2ceYyeTvP7hHSbQE6LpjBNL4TmHqnuTSlRs8hmRCyvPst8/5OWrspio3MQ
         VWMf9TFI3qrhDa7XC71andGlCI2lXdzHRJftz54SI47zn29eTfKu1pCAs5Mw05dair/A
         p+/0vBkTqi46yFCchsh4aeSSXwE2wNe6bWFiAEwQPic6aHH4VR58/YW47LEPEdevSbaJ
         RpsthIoS1O24gGp9EAc1Nq7Qj1BnxWzVocZ1dpn4L1ZR9zf5QMLTUQTRE0bHi5j/qUsE
         y8W0kPtEXg/2oq3IAOVL0VnnQyfLn/Agt6HC0XRaKY4qVUP1fUiJ0I+BgOPA1/UVlQA/
         LztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414910; x=1791019710;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sASaYvsZRpd1tn0RL89dSce6GPhVNOMoBLXnwjXq9w=;
        b=qsLzPDFDdh6rruUo5IKhC90p0faviyyBsOGFy/Q1DzHKfy8UPJPC2UV4Q0GwM7bxwx
         kCLf7Pr06SyVgyQkPQSG0Jq5RGLagXa1xKIGaB1C/WpS6fvC0qeNmQouAtp9RcXRCMMM
         kqh2MCURqhZ9xeas6ZtwrQnHWkXZifLHbdzb4EztlonqNMqW6Gv8WwMbGj5Vw+J2eTIW
         RiV1/n9Rd0oTxH6EFb5ewJMmyVo9a5MmJxjgJL8W0fU7iYu556ML17EQSs+rCL6Ae0cI
         qIBL0/+MNKNazEqsLW3qxTHV4NtAwumewMiL1+W3gYaWqvRxFgme5w8tYVNO2GjGcMOB
         AzjA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6duo3+XMQZGcVhlaCYW/TFtZE80R3am0oU0vDN0L55vNegtPLRD1kFeClUSxvGUM2uE2yBi2JcDv@vger.kernel.org
X-Gm-Message-State: AFuF++k5fkBAoK/yCgSuUAvb0of/KpJudJsJW5OstZCFUl0w1pV2mKge
	BFuutiH/OCFVY/yJ2F88k9NxCSu4bCvpm/XYvDHW0hWYDUJdIUosIiCN
X-Gm-Gg: AYBFou1KYT8tsFON9pARwZs4Kc0T5pGE0w0VjFVMBAUfGjAue7xslpYbgQZx3KKx7sO
	4bnzjGRy9rLTraM9A6qMUdkaMJHUjwewSV9mR2ceeupqq5QWYdiVylyTcSFbA7CYLuDg3hECWA9
	ohnze0MwDfeMtUmtQO5pnLcCXVEtnckBOL1KHlePWM00ittyzUamMD810bQdHafO3nZ4pWvXB3a
	bmB/LbS05v/+oRnHjqtoTCt2LIGpjA4i0XZJyQywMeQqo7toB9GZbMSIyZ33suWuv3aQ6/Xmg0a
	uz1m1DBbZUDcSNZ8cgOTepy9nrB7Qy4jL/jk7cZB46RnTukYMvGG6b5LrSeHgkPOdQyHvkrA+qe
	Nhn11kJS1K/D43zJoOWoBCXG5f8TeyIvhmzdTB3nmDC4k9V3vzqhCw5GqSPCK9JwkTNAUyigWnQ
	axVkYN8Il1iiddiG9iaIlTrx72S1vH18/ApdS1tcKGyrZZgxdXS0M30n+WwA7XybnK5trciAqQ/
	6sO0l673dUF7NJqkwvS4wvW6uEvH+W3010n+xLGq8Ui84LUjGqBTw==
X-Received: by 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr85011295e9.5.1790414909583;
        Sat, 26 Sep 2026 02:28:29 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm140014735e9.1.2026.09.26.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:28:29 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	sashiko-bot@kernel.org
Subject: Test for [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Date: Sat, 26 Sep 2026 11:28:27 +0200
Message-ID: <20260926092828.11675-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211816.89954-1-lsa.uz@pm.me>
References: <20260923211816.89954-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For this test im using every component and program used to its latest version available in the stable chanel (the only exception is the kernel, wich is 7.3-rc4): mesa 3:26.2.3-1 libcamera 0.7.2-4.1

After applying the necesarry patch that deletes the line "const struct v4l2_subdev_client_info *ci,", the kernel compiled correctly whith the patch applyed

I made a thorough investigation of the camera and came accross the following problems that affect the camera using the CPU or GPU
 1) The first startup uf the camera is somewhat slow, it starts from a grey image and then slowly starts to recover the color of the room
 2) The camera is horizontally mirrored in qcam and Firefox but not in Gnome Snapshot ¿maybe the camera has a mecanism that Gnome Snapshot uses for the correct horientation?
 3) There seems to exist a bug in wich, if there is an object that moves fast in the capture zone (like for example, a hand or a person), blue and yellow lines appear in the area in wich the object moves. This problem does not only affect the front camera (IMX681), but also the rear camera (OV13858). This issue is present both in GPU and CPU mode, but the error seems more prominent if the object exits and reappears in the capture zone and while the camera is starting up in the first use, This error is also visible if the GPU is used and if you put an objet close to the camera (for example, a white sheet of paper) ¿Maybe is caused by the ligth the camera recieves?
 
 The GPU debayer is still broken but i do not have the knowledge or time to identify the root cause, make a solution, create the report and send it to the corresponding place
 
   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
