Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092410;
	b=IJAuMraw9lE/Hqu1kQOJ3eexpWVD053ocXNKsJKRWPPiRs8wcV3Os/uHJfY38bCtZGsF
	 SX1MUsVyDIj0xAO4FyYwJNurBUMCQJIV3EnEqO9T9znHzuI8bhAJ004jtDw5UBuymsoww
	 VGXRq3P9N92OQLfPKwdnpUaXIMCmXEJHfdNp7F3c6BBoQWcL1ZdoIuCJ8foYwkhuHXpIk
	 FXYPDLsMWQRzfka6jV0JOWvlRMd3vDnvfTwvIt4ws43NUMJsgHIlG4ayqHOmCY6qC0OSo
	 kV8elr4hrbkjC2ReqsmTBOhspIfVw2lHfPflUuNmrR8UgeN+NKeVkX4VmhvA2HyFB+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
	b=JJr8Q/rK3Ma5QQ2wUdnWD03DrxSHuE1vwMlsG7FWBbvU5TDQrYKhpLYDaliLc4iX7HjU
	 5IGvs32ffQKVJ16sXh25qkUS8rFIJDEw09/pN7mo3umAVz2kHqAwCm5EmEJMVkI1yiKN9
	 BNA2y+dfSJhvBomgu8chSZ/5QR8I30UzCovohibhpNnwUtMqIyrwnC9vUPkKbbje6Jlo0
	 /0CvQ7gzfMinASkSPUbbdI/pIrM0swkJb1vT3RhO4uvo7cRAx+57fUpo4dOxL7VdyJS4U
	 jKozhOKA54qnMQhYhdx2uE6MWelbabXjDzvfmFAIG2W0fu92x730Yi55732UXm9shJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20DB606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so3630328c88.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092409; x=1795697209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=BfVexAMXUExPA/yU1/HvoxaKMziAg/iD+IUkHNZoxPYzkEA3j1C6nIt89AbCwkXPRO
         /cce9sydc7DmUaiiD9v7hE9hgI1ZMsnDCrGgTYI/xVDxscovZXfGZjiTvCQC5CBJ4zh1
         rbfUnR6wOGT+8PMH0NHQY24Gy9AVVc4jze/FJc+s66e4NVtUg3Oi5AK3PlvSTRyjacP3
         aOwAfj7uxwj418/tukp5tVVEF/PUTXOL4hycn4H6XyLCVA0Qkw8gmZIih5yFRhBe6V7P
         YH+9n4wqb/IMKYyg+jwFOeRQEXeGZ58RtlgqVICZ99RkGTmlcRt0tbnS8gt7ZXphedba
         4iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092409; x=1795697209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=cJcH/rmjpwYE4VblcE6K4bHNTsV2Y6pfhpsrFHRA1QZCoEE+YE/bVTGGT0LGCyKwBy
         zPxTzOH1vlF+hgz9yexV9oMvhB5g/g3JoBbU/n2rTEak1hlvZc5dTMdk/5WxyFJ3P5Un
         EjfJMCoKErCkjnvMgxb8HfI63B2rfk1As7xvvhXBaK7vhzNiwfyLP0x9qjkrzKIw5G1r
         jU3UL8pFjMWmm57MsoiA8wW2YQcicfzop6gGTFdBcg2TW5DthdP5JGPS1AWFgC3f6GSR
         EcDIewmbW7Uhld9Hi6P1CaBAaaVfS/mqk0urmYbEJSFSl5lHGkVfI0RgeSP/lJBi/Tl5
         ow3Q==
X-Forwarded-Encrypted: i=1; AL+hErHWa7Z7qvF6Oa97WyFZJ8ESTAWi4cX536B6Ld4V/pICLOTBV7jsG4rBfhwwXHYR+q8WNtKLgHcAqc5i@vger.kernel.org
X-Gm-Message-State: APuU4Z+OkzZEA4G4+zUa4IYU+ZVCBz2ZboxxCo7wqzEbkUWkqmb84vz+
	4yohG3Ot7iZVneGg7mDZjDfiplohvR7kVcpDTRtZJMndvY3UTItnwIbC
X-Gm-Gg: AYBFou2OWX5DStpfaKBuUxt3eHa/BT33C79W+DRxEr9bz2Uf7Hg1I4FJ/DUE8nvgn5X
	F63bfhE8FrK/7VXuWTIL0Tp/XQ9rlyJM9KaHaXrEuTTNsFe5Bb7B7kdkoP0lZHpT6QNrKZGly6v
	FJw8AjnynQqaGJ+K6rQ2aPDYUPx08J2txp3KyLSUFrOa/Ftzz2dDkMXZspbt1qJ4eHz3wN654FE
	Wtbpix9MyP2JSs021IsPDnT0Un0uMiVxDp/4nHVoxMTikeSvLg13eJRIlkc2hJaSFlmLIvIl2c/
	sWLV/HSKMvWZo+YoWFNwee824C752mnmGId9/XoYOb07ug0RSN9SaelkuoCTIFHPdqBcNyk8G16
	2ye8pcBEpv8EnhUyc5UFC+iLIz4PqAaEgHuiGvIBzwwaUehXtT49Z88MoH6jwCi6a/c2nWEyJqJ
	yWjo3HRm13snoc2QRN9LT2UtimQCJEcti2xJ0FGBIw/MJ5eAHQoUb6QRfFlIoKFX7naRTsZeqEM
	rGhY3uG+/NXwuvLdKUT2a4w2IKngoVqBoJu7naNaoRp7jE5lD4QVOD3qR2WoKNDi21VUOnODw8x
	98CzzVlJTt5twqHZQnmrNdEjyhxkTFULFXk=
X-Received: by 2002:a05:7022:7f15:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b543c3d7f0mr4441883c88.1.1795092408616;
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm13868656c88.14.2026.11.19.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 19 Nov 2026 21:46:47 +0900
Message-ID: <20261119124647.983-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com> <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 06:54:48PM -0800, Peter Chen wrote:
> We did an internal discussion for this use case, we may prefer the solution
> that let the PHY notify the controller this PHY lane is going to change from
> USB to DP (4lane) event, it could keep driver independent with dts for this
> feature.

Thanks, Peter. I kept the mode switch in v4 and explained why in its
cover letter. The Type-C mux framework already calls each mode switch
linked from the connector, and with the usual graph (HS port to the
controller, SS port to the PHY) the controller is called before the PHY
changes lanes, so no new interface between the PHY and the controller is
needed. The cost is a "mode-switch" property on each controller node,
which a notification from the PHY would avoid. If you settle on that,
the clock selection in patch 2 can be driven from it instead.

v4: https://lore.kernel.org/all/20261119124558.1548-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
