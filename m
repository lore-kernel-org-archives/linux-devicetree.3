Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD72E7375
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130345; cv=pass; b=ONzrUwlYFxJRzj9IeBSghd5SjgXmjr6GmL8mvsWRPzcsdynaXBxz+HwIZLYLWVjY7c2uBVxzUMHlwfWDS9AGjwkLUdIsQiPxkCqiHdM59M7bL5/m/V+Zlp6OagxnZnIckaFdD+5otN4/ijVYIGSyvdLYn4sWr52B8jhp4vaj4Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130345; c=relaxed/simple;
	bh=84BV/mwMU1e5gFyzZ0RhJH9dPV/GfG5h0Bh4TFAWkc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCVe3qHHXCggQr3D0qzwtVng4JcYpmffd9zgG9LVm3BjraQAHWUmpsU/Mpbcxb4d9LjiV/SMmLe3bkbaURpQ2mnNqqrCsMtdFRybhbjt6qDF1nMFY6DjWgcuP1qUKL/WR1dcwgBHbmeOxyK0/5QUwVBY1Fq3z2MLg/TbPcSzRao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP1wMLXk; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP1wMLXk"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660456349d9so7142822d50.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781130344; cv=none;
        d=google.com; s=arc-20240605;
        b=awu+N898uoowKA/RN6I8EcNUaHzxM8/CLD4NzXxMu01WUyu0EnbOJEYc7awf93Camk
         Kb36SR+sdYIdcKdPNiJddz8BkfwMuzmEN2Zx7VWQNngazJOtS8swa2u9wCkMmNpdmogH
         bxiMBn0H4wHEE6hIPE2vNPK3ciVGzutLwxXSEVv8PvHzn0ylEeeQl8U7dwwS6d9+HfcX
         SOZNIibKcNvOjmTfljQiQkM9J2bn+uW5YwCOCVIh/nggJF8FmXsUPBrpgyddTHaCUJi8
         aRw5AsOA7ooVKUcfttBCzB7FW7ihG6cREvnmN9HEYIR0IpXg1FBftR49cCX3ZEaliYpq
         kZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=84BV/mwMU1e5gFyzZ0RhJH9dPV/GfG5h0Bh4TFAWkc0=;
        fh=wjs58HnhH5pHHvp9pHw1HPwvVBxlrIzJl9Ysdj8v+CA=;
        b=agIH6V3h9zdDln2BRFjtQfjxTErukYqhx6Kk7paG25OaJc/fT0Ck8U/xt/4XAm1dVl
         /Rh0+HVn/yD7JpjJ3xnldiijAUXwGw3xionwhCKL7o5F+V1RbxJSmGpRYCws9Lyldmy8
         BXp56gO8NwQpqNTXuXLDv9izcYbTHSURuoqnwJfSNaPSu7EQI3QZdO1CIaG1q1byICmv
         MlN4gvSsIkdH3fRmVdrX+8atge9vfmQijhomneaeBTzvxhtflvx50Q5lZn5H4Wsl2VtH
         oELHv43RqhKtBLjkm4jH4e7BcHBqI4yEBaT9lcwG9ss7U8QcCGMalQVT2z6BVuaMHZuf
         l6zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781130344; x=1781735144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84BV/mwMU1e5gFyzZ0RhJH9dPV/GfG5h0Bh4TFAWkc0=;
        b=UP1wMLXk1fmtUSjh1b96WXWbotb+rtGHKHRLzUhFimEJ1FHVzsOiSAubESByfS766B
         6q0quP6hUj5wHBpAWO/uhqeTU2AWO5tW4WPGbyw5BvzlzwR3oW8iMTH63AMG8tXe/Bhl
         8IMBgSe5IOZ2QaewwEDtIWJmuJ6dlzy6dfHqcszx8hforUfEuZFKcWWmJQcJP9DEM1Ie
         6RonfrzjxfekSPye4aEWYsZcAi1AslvNURSIgcevKdwL07Eks4QQPO/8/mRjJ23MwNpp
         QVOjAMNXdai2V2lfuxVMbsE0+kiJ1AbJ7kpgo9NlcV2xkbmUDm5R34602HAWpBBMFvKq
         xEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781130344; x=1781735144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=84BV/mwMU1e5gFyzZ0RhJH9dPV/GfG5h0Bh4TFAWkc0=;
        b=LWFoQMUeq+5vw5y759d8V7WQ9+RT4oj36K/sXGLM+W/xpNsBtx1bHrItbdeBX7TURP
         sU4UaFMuyG9IlZgZ57HrZQE0e+/Zq78JkVaMrFLGMsO1RuCCDmokjOQuUIkAcJuKqZ6y
         zZmGlfoNNADIW0S72pAqkdB1KB5Uu8auKOC+FTbBwP1bQyhUzrKgbHcov8RQFcuLVk6I
         3+VwCjgmzlwN8ZX+trRU0CZVFYmkxybaWhNSAU78r7+wxcu2fp9+VCfAcFaeqxfDUyWN
         xzx9q9nqEM8N4+YyoKtk90Tbe4RSUB6zdH4XtEM71zw3jkMWqX9+LmPwHxfCjoIhv4Q9
         8PyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p1PN9OyTu5AL+mWZmCaJDdqBZUqRpSp7gqKYuE2CQHvMGftGV4KeG/cdOjj/1jtklJ81H0NxGEoAJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LfL45Lyx9tZoN30mZYAaX8nU/gn9s8If/GJzAu7pqW+Z6jkl
	PiY3LLoe+oK4oMuKlo2dbBrDp+P7Vhxdx7kWz5M4SBL+jE/jzOE4vNA920JkNwtuwLwVrZVv4K9
	CTDuWb0EIpmgYA43uSAU1lYbQjuSb5GY=
X-Gm-Gg: Acq92OG4qtaPSsaQNvQjclpS0uB6lZl7syRpOYKwYife/+w1EjSLQDxPA0PMdVRc6gL
	r9luyq49HANmCdly2/BlZZxgApAL11Eukuvtg0ttoVd2gLG+TNjaA6vge9tRUYCoUVZyyEfQjxb
	6Mt5mJlv6cdIVN5x2P9QrLnuVPDuNxyURelObwmpidKNz0/YP/8QGeHwn+K7sVHHEM+eSrQCLLa
	x57MQl34Cbk/PqE3cTXovy4PJLoc/BP7k8RIUXQ0n25psdFwCrsLJkHKQRSGV/9rTnFhnpeqQ4P
	ccX6BDz0PFOf3QM=
X-Received: by 2002:a05:690e:488c:10b0:660:8e61:1a49 with SMTP id
 956f58d0204a3-6626586508dmr1038060d50.18.1781130343683; Wed, 10 Jun 2026
 15:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609161701.52513-2-m32285159@gmail.com> <20260609161701.52513-4-m32285159@gmail.com>
 <20260610-turquoise-marmot-of-research-c3c51c@quoll>
In-Reply-To: <20260610-turquoise-marmot-of-research-c3c51c@quoll>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 10 Jun 2026 17:25:31 -0500
X-Gm-Features: AVVi8CdMYLBI0tFUeZZLTv33zNModoYgKYUA0hqQWE3zfzu9UxvulxK2OuvGpMc
Message-ID: <CAKqfh0HRjajJ9v1jeyTx=nJF4FUCnW_B2v91RukDEcXP3LmRsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself as maintainer for SPS30
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Tomasz Duszynski <tduszyns@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jun 09, 2026 at 11:17:01AM -0500, Maxwell Doose wrote:
> > Tomasz's entry is no longer valid, as he is not active anymore. Add
> > myself as maintainer of the SPS30 to replace his entry.
>
> Same comments.
>

See response on pms7003 patch.
