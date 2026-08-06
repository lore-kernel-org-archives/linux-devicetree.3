Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843A3A9879
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025662; cv=pass; b=J3RTrR0xQ7oYibzQHER8YsrMmtBtXBTAupiOrPjGQytYOTvL9Aj0etrdTyKyra0n01Ecta4OnOxsnaLEgXyi3SnwIUtxBwDISkp1Sg37pYj6HwONTA05Tb1jYbcJXBPOT7DTUfFH+kenLUlB52nNxym5U2Bbj6GraD8ScA4L54Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025662; c=relaxed/simple;
	bh=46+6JcjA6rR1QTyo23kusNcDsQJr8RhFi6PkBjNbAdc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=R4hvQPuIOK+8/ct4LXRLsg18yVEgMCURhe5GuxOFAWZgJjOVPDbTC8Rt7kWGNT5G4kgY4BRpDsXHNVNHqkr38qXQjKxpNMh7OOPYjjILVJyarvUE3E7rjJKq8TGJqqpnIurRR6Yy2zGGa1BiZRlm27NN7jMtBPAhh47aMnxS6LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blr/mYQl; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blr/mYQl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so2408826a12.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786025658; cv=none;
        d=google.com; s=arc-20260327;
        b=obpOEX4ypRJFSRWbeI+7y6u1kJVurCYxkmqMR4gEcg/dPjsVmzyk+peNGrRpLMoHQN
         B2TKkzhR2kdW8WaZVmTctp/SMPq7FW2E24+u+oEeGsxYuIkf14dIZs90Dvo/n4PVIxI5
         8IaEQqq8GMtXyEx2+EUn9KL9J2uJ2G+3tS4Kh9cjn3sjO/mONtwe10O6n/aJAdqCSUMx
         3sMpPsRYuYbx5rhNOwHfbxkxl9Cvc+2vTMAB7FbjEaGneKnMLxvvNFfDbvDU8B5MMKGf
         O7/MPiEO7uOv1iprfKFBdGSu6AocVSYpm+/4HBQbM+vRzphJya86p5b7RG7pOszTyXfd
         0z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=46+6JcjA6rR1QTyo23kusNcDsQJr8RhFi6PkBjNbAdc=;
        fh=Aj2P0+JvzE6UE8i6sSCdIt6UDh6uY0ZmQYHH4E3r3aw=;
        b=HTQ9fWmvhQ4cMsx4CuybhcZy/Iw554U9nKNCBCooD8i/GtkNE200KRGvhWxJjfmwJc
         v4qym0e1dIMIpBG7oPisNrAwKhsKm4aGJA/0cU9l7t23f/Zr8Bu6MKb2sIfGjixlAJL9
         Z47+vjWFOJXPVMIngD0LjKIUOJ3yKfrSMV2sh0Ty4ojPliaKbDqOP5asOmPPFVBmoX66
         4+TYGPiFzyPDlLpj/6ku9v6qypX+pgX4BgiGVmhpdceMGVtrfsjxN+hfGAsp6Il+QdHw
         mHFl7arw2YzdBworYENxMUpB0PjDSD6i5wADPZc0staQRBJNe8D+PXYlW5j8ZylvW/26
         lpRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786025658; x=1786630458; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=46+6JcjA6rR1QTyo23kusNcDsQJr8RhFi6PkBjNbAdc=;
        b=blr/mYQlnKQU0et8FG3B6vi/I4ZaiPIhUbqaQAVU5lgokjamnWhREUUfidzdU29RAP
         7YqRFyVZfClwpIxUTlIijSxR6AYfLjEQIyZzKQGmQtEiO2fOvl9MLnmitHZf5rpD0gvA
         AU9+CbIjRs3csIiWjbMOUabUrLjU4lj5Emfa0+ssJPsnWTA7JY3+IyxLlmd3art4Cktj
         Pvqoa0JXq4KvkXeJ78SESi8LppLKCvri8n6QSyY4JV02D46vn8zTXxnceNVWWFFWeZHW
         XFW8VX+h49mqgaI7bp19MDLRoyQzGRl3ouDbjwVXenn9kId8IRnxnoHohwtZ7PGFVdUO
         xV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786025658; x=1786630458;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=46+6JcjA6rR1QTyo23kusNcDsQJr8RhFi6PkBjNbAdc=;
        b=NDhDI0T3ukNaRJ7IlrOhFmeG5Ajc5IUEov/ODyd8E/20wqvW6uGE+udEwJR1caxBMJ
         +xh1gB+hsQOLt7nBTYt90JrT6HdTxFhX0KD+/yEkEOnuero0jGW/joC095MYuYiK1N0i
         MJp2+9+96YetZesOdqIfEPX07fvCMVw3q+S3+sG8X2w9VptmotTmOOcbMmqN0ZBPEBdT
         j7XipIcmAg5BpItRBG1qOQz4fOJ0iIDCGema+VNxQQcvmYWlV/FeHkdQYQ+pIW1EtPPm
         zXxmfAKU5nYNjzgWpbyGkBjQpDRn7ImAb29NDD5GTE+I7MZPjZv29x4mNxLoIznp+O2t
         /dVw==
X-Gm-Message-State: AOJu0YxY66Qip3dTo+jBmEIja31kOaPhqg1aE1lVsIq8ZMW7DxsQAZc2
	tmRSHNUbO2gWS92ZHNQ1MTyaDWrGQBRO4jSjXrjAzUqrMYT0M0qu7kmzxv57J3NKgNv6AqCM5DA
	6j8LKguyuPl8CqTdvbH4tAP6isVOYhdo=
X-Gm-Gg: AR+sD12Ah5D097CbK8H1neofW8jEu4kPdi2LEvtquMVFeMEPJ9cH7LIerMKV7v1Owmg
	sbLFO3JaAT4UZgdm6tCZ7Lr+J7y73zH/iR0agC7S5taRLIa1VjrmA3DoGGww+gQ8n4f6YBQSYeO
	Gl7jGwXBRlWe/VxWpIY4Ckqn2EgokOPqLuiDMFHwPMrgPBO2Va71Z0wOEHKrpuAWX7PbBsXVUql
	AIGDt0Jwuj4GNSaKB1FH7FC7HUkCUzB7VOLjzF5Xq9FLUjvAZVIBFP1JnJBStFrUHv8Okj0aM0b
	FpGsLsxK/cx06OWCadIxxEslJITcvvUuzhLXiCtIttr/oIWY1cw5r/dtq/BgzHUGXUALKMoA90s
	bvNAqY5JYGMxVIHJ1b2ZsEl22Fixm27bFww==
X-Received: by 2002:a05:6402:a0c9:b0:6a0:926e:f8f9 with SMTP id
 4fb4d7f45d1cf-6a1b4a9e9c8mr1139610a12.2.1786025657529; Thu, 06 Aug 2026
 07:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
Date: Thu, 6 Aug 2026 16:14:05 +0200
X-Gm-Features: AUfX_my-AHn15nDLn3sdNVQS9_K6dWjM0r1262xHTl7Pz5OygNB6RwCJyxMasNU
Message-ID: <CAM49wQtRt5JWDWZtu4Kc-Lk9miv-Uc0nYocd7JFiTVycXQExkw@mail.gmail.com>
Subject: Guidance for a first IIO sensor driver contribution
To: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm an embedded Linux engineer looking to contribute my first sensor
driver to IIO. I'm familiar with the submission process (I've had
patches merged to staging), and I've studied the structure of existing
IIO drivers, si7005.c in particular, so I'm comfortable with probe,
channel definitions and read_raw.

I have I2C hardware for testing (Raspberry Pi CM4), so I can buy a
part and validate on real hardware.

My difficulty is picking a target. Most of the simple
temperature/humidity sensors I looked at (SHT3x, AHT20, ...) already
have hwmon drivers, and the recent parts I found in vendor catalogs
(e.g. MAX30210) are already being submitted upstream.

Two questions:

Are there sensors the IIO community would like to see supported that
currently have no driver?
For a sensor that already has an hwmon driver, is an IIO driver
considered worthwhile (for buffer/trigger support), or is that
generally seen as redundant?

I'd rather pick something useful than duplicate existing work. Any
guidance would be appreciated.

Thanks,
Olivier Tanoh
