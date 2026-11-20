Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151707;
	b=PDQr5Ox+JeRB23fjhrP9A6hqRXlkbZJYZFm4XaSsLOt13syjvWDnSaDefrlDXn5wymJb
	 3MiVzofO4l/aeW3zB3rg1x8vtJ9UxsERzw0gLF9EHS/9rJjbSbGFwuMiMMrHjW+JBFGWZ
	 Q75lpHGRLtEd/1ZMjbogmarYaVGuvnBJD1BSLc8bgxnSgisR6LXIstM/IrjziOI2r7250
	 qAlbFJSe2tnLTQpB5hLIHjS704zMlEXyAILuKDb3gt85wmiaQ90dctsVaO1sPnAN8voaK
	 3vsy+17jh0gP3Xmy+VrvMWnZtvyBf4tLBuLvV+rUwUtCiQ5B0YVYubuPiMWo+YAbVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151707;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1EFx4BBUnJL74M9wJJG1K5+Mkfotjm/Vr8HWMsecgf4=;
	b=v9E4dJ71JcfeM9ggD7oSDTbWki4CMPld7vf8qW9sdyTEgFJJZlz26oO1oNPtyurpKqVy
	 v99nMy6AebJtoVhcSh9wdRPNYFU/iTlnUOjTgNzFR18Sxztc8ypeaI6QLSYVde4AWcl+t
	 v81OohJCSfj5HC096dbzfDHINRtV4UlpVNbV8JUeuNObUUshOqBSXDmdJ9Hx0jWTjQkaz
	 B76UEVwrkmi5cE55CtsKH0hWx2+oxy4vqpCEq89Q9JOa990N1iuN7Y8z+NajumL8w1H/J
	 2GKWarI3pg2as2Iaz3R7FNO/hNq3noT29N39l4fMQW02oTEr+bsPYSgcALlrWmcIjjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD6D606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD6D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so318848a91.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 21:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151707; x=1795756507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EFx4BBUnJL74M9wJJG1K5+Mkfotjm/Vr8HWMsecgf4=;
        b=OAOfIiA03dYFUN4rU4iZx+DyTsZfCW9o8nae2RqN8elfUmEfYP4jq6JVGJrqbuUwBh
         6sxGZHsg29rDYurDaaGZhdJIBNogabpL2No+PpWmFLKhV5iXN4XA0dD756ckl78N2xJx
         MuBoK+e2voK1WoSCrpCmJ4b1+6xoZUToBCb8ECVQnwVph+I1r+R+TJwso4AyQwYBv3W9
         68F1YD/UT0gN7IidwTIseFuEWl9Y9X8NJz2lKDZOXM5Aaaeq1UIxjemEtxW8M/cfPvxT
         +uVo+J9gqP1SblQPM1L5vDkbryzCl7IjSwX5YosM1YmOWvod3fe6WoF0QcnuKU5dqe3Y
         YW6Q==
X-Forwarded-Encrypted: i=1; AL+hErGT6MuhM6tV228rS6yCn5jYTR6wud+xbh0PUhFmGNJQxJKzjvlAMXfDZLp2kVl23AY3hoPY/2QkGeuk@vger.kernel.org
X-Gm-Message-State: APuU4Z8HRpZogHaSgdqqkz0ZByseQikX7f99wZwQKemNFPPPkBXelooU
	kLN2X5cViFBA2NPZZF2A4s+iok3kG3FHd+rZAjI9feJrrhwKctWv2h7WDgTnxjdx
X-Gm-Gg: AZFdTZeU4XKjjwYpVgG0sHpVh0/8HwMsXXCEvhHfJBo2NhawwSJVapOGWRjZSs2nD7e
	o/iXPFIdtNEPLYMnMfYCPXgZSmVPvUMpaMjFAgEUsURtm4iaGVejOpfzZWwxTV7v8Wf+jA2u65d
	siLPMeObwhu6rTGUW/HOgBqWwFLefv3XsGqTWaYIaTVxELj20T5Fq5EFjGBoTFLTr/2HYM4z6iZ
	U7ASbhb/A31nKuQ8IobJQGNQFma3iDJYiRm0eESC6ZIiLUB+8DlRBHNJJ55FVQwc8iVsufAo0Ih
	FsL0Fsnw2Zfpe7Pk9ywSodmNVvxecGryV3DQgwkoVafprkI+w75I0zN83n+2AGXRqcIgmd+9JlM
	B6npvctua1hxg1bJqOPezAnAQn8lDrKH1AmXkUq+qtkmRXKaMQH+1b9QgObqI7qaXdnXXZgb25h
	LqS7aAhkdxYiD8USN0fz4sh9PaOv3HTEQ4MJk0IKxoSN8uFCXOO9S6RQRbKlCPK7qfCl6i3mmP9
	A3/ROsj6ovwSJ/MTetdSWARiezjAzUKee8ucghqBKLm9L2mC0qPN0pErrlBJD06vSsaewfBXSWi
	jF0QqRlmINZVfdDikKKa2mWPuZ8JVfrLabJ0YlX08waB0OzcNhrRh4cW4YSXd0ACzi3IQP0ziz8
	M0VUuUpH7OgWte2rXQypwBkLpWo/L2sgM+lWV963psstz
X-Received: by 2002:a17:90b:2701:b0:3b4:184c:c20e with SMTP id 98e67ed59e1d1-3b41c7b6809mr1548377a91.4.1795151706661;
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40548711esm5934993a91.0.2026.11.19.21.15.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38318d69173so1040827eec.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 21:15:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHpCGL4tatoTXzAShaaCnCrJGgko1jXWD0durEe7DFpt9NPMELPNPj0pzoEF+kA9xpLL0Zb18CupHcG@vger.kernel.org
X-Received: by 2002:a05:7301:4308:b0:385:496e:80d0 with SMTP id
 5a478bee46e88-3856f55636amr1795390eec.29.1795151705592; Thu, 19 Nov 2026
 21:15:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-11-98b836b1cddc@telaak.dev> <sashiko-outbox-224266@kernel.org>
In-Reply-To: <sashiko-outbox-224266@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 20 Nov 2026 00:14:54 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4yPRNjArxyCrPwM3xWXfYXvjSYbzQBOeKcvYaroJojxg@mail.gmail.com>
X-Gm-Features: Aa3M54rMy6uhn3gPkviQr_Npz2srk2_GgikoHxo3cCJaL2GCNpZ3uPftOnUi6pc
Message-ID: <CAPY4CJ4yPRNjArxyCrPwM3xWXfYXvjSYbzQBOeKcvYaroJojxg@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can a concurrent unlocked write to cdev->brightness in the LED core cause
> ktd202x_brightness_set() to disable the chip right before
> ktd202x_blink_set() or ktd202x_timer_set() programs the timer?

Yes. The race predates this series: ktd202x_chip_in_use() has read
cdev.brightness since the driver was added, and turning two LEDs off
together hits it on mainline too. The fix tracks whether each LED is lit
under the chip mutex. I'll send it as a separate fix on top of this
series, or fold it into v4 if one is needed.

Joseph
