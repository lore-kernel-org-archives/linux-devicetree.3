Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B73BB48
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709246; cv=none; b=PJ2+cROY5HBh7huIhpHBJ4WmTv4/i+aNmQXCk55HkxejjSLgCN36m4JXC05zpqaje3Xrc0WprJAQuf7YJRKBxVPv2zbuVntISUagnx5nItWAQS5dgyBFRIJdp/D8+PywjgXF6NTgg+d8AiPmfu9PtDYQ7gbRErXOv8xIY6y8evE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709246; c=relaxed/simple;
	bh=EvrbSw6riBn3WFQnWMdTkjWQdPI6Io5eRWlEYnSUdh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEeRpiZZTl1dsraIdh6bj4hRzUF3bOOJq61X19Xg7ZnT7jv7S48XFWF7MAtisCCLOqyTAfzrJj3BLLQLBjqRNNUz8R8jrtFMMbeBDnw8Aib5LgtPnRcm2RftkJ02RSJAEdgYeWLJ+TybEAsfV0Ww6Mt5PwTMB7hjjZZ9Orczngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhcHMYSC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhcHMYSC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1727971f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 08:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788709241; x=1789314041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zb+fQYyrJ/70MX/Kj2ZYXqK6NS7Fru2LZRqOKcxD/0g=;
        b=NhcHMYSCIaFbAk2O8fs7NZp1OOu8RY1/jIzrmLmc2EolExnGgY0/SZxD6w/SyNBmAn
         XTalGJ9OsMh4cjVfNIVrE2cCigbG5mqnlGa7lt7z/LWysor+ppEU40AeL0eON+xATdAh
         ew4bK6vx2RgGMB1/v4Xtksdw+vuNBel/45OexV3v6kU+90nDQ0byYp0e8OjHbtqhYQR1
         N1jM+XQUIGkXBAHhEBl+7hfQWLzdefnelVlH6JW+XgjJi1wTOz1OVRBnu+XB9IUC4d/B
         7eEfDxEt07mTSrTJe6HPdxYDGQHtiIj8cYCHJ0qNKKqktLf34lm4KXVKNJb5S9AW6bK9
         WgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709241; x=1789314041;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zb+fQYyrJ/70MX/Kj2ZYXqK6NS7Fru2LZRqOKcxD/0g=;
        b=KejJ+Kkx0nVJt88qWwi8mD+MsgIosqfArRsIHHUhfBS54zUGRMWfLSKp2k1OQ5sbaX
         ePwvio+nc3ouFZfuhDnfB0PaZsnCWqBjgr8ZragbaZYo4LDC0AjzdfNbYA96SbgYkxvi
         QfFbqSgCwhvTH42453dRQ5PzSEqDxqSLrxnBOe4lmpjaBf3/UBmV1nVY40P74Cv2Imhv
         T9qaT6gaSIGJn5RR/+WqhEl/yiPzbLAOE1TTut1DDeyV50vsKu20lc/VJzxf1lBtQQbI
         Qi9qpnVZ4wS18Moj3D8b8qf9vqy8tomp0+tonSVb0zCcc6jvymkJUCs9VWDuh+WHxm06
         gb/g==
X-Forwarded-Encrypted: i=1; AKwUvBzJE7i+V5qwESlk8VF4NBXS4LbNzhTSZCcMa8CBWSqtANq20RnJAZ2OXIXCVx2gjcMdbvDJXRUu3Dbl@vger.kernel.org
X-Gm-Message-State: AFuF++mDGCnDzDTkZ5NB6GKLNNrE+Cjyb5bohqZ1tw0Uj4gp97M7CHUB
	2O78QeEKOfJmvP5NzY9lXDOBwNV5WlKc0Cnl9cLLQF6rwzjtWAvkAO9O
X-Gm-Gg: AYBFou0Z6Lc4pV0an/3gauWknxXEnQiTyMjhv9FuFIiMpM9spS7S4JxZA2iUhNhxlXP
	m959EAY0AuEBoP8svI0ixB400VlOcfEPZcNIdoy4D/TCOAwoQji0ExHmmkqt2pNSPg39+X3f6Vo
	6E9RhOe01RO/8HIHpG1uKEDCV6PtECehIl4fvk9Utsjpjih2A/aOO+/t9RQJrZjnGhoYdxV1ikZ
	WfNt9YgcpNegz4iDdJ6vim6+PiTgempvRU3k4jscbKqat0GtyCDMmBvOcqAvsYgrOITJI1qrZ1x
	v+5na70pA0WrOMwKVKbBrVKe25xLsrNaTMsuUItK2rEeT0wZSXCMN+n7WeZaPSVvUEL7+kMquVO
	4pdm8MYMZ/GuHWVXexNKly/XSnjlurV2YKgbW5Q4VkuY6U26TVDB6EpQ6wUi8UpimWLV/aSECc8
	cdCReSLrjg9s7w+mc31B5UUF4sF4Zv+8MBZ+xIUzAVbrWl7C3BuwZrauRsooUhMTSWD8D8h4QLs
	6wRvip6lpme/cQDxaInE55YDuQ7
X-Received: by 2002:a5d:5f51:0:b0:485:8a47:5b9c with SMTP id ffacd0b85a97d-4858a475d7dmr15641422f8f.57.1788709240790;
        Sun, 06 Sep 2026 08:40:40 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm23825319f8f.10.2026.09.06.08.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:40:40 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] X2 Elite Lenovo Yoga Slim 7x Gen11 support
Date: Sun,  6 Sep 2026 17:40:21 +0200
Message-ID: <178870922140.5716.3695070640167210897@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Jul 31, 2026 at 07:59:43PM +0200, Konrad Dybcio wrote:
> This series brings the bits necessary to support the Lenovo Yoga Slim 7x
> Gen11 laptop, based on the Qualcomm Snapdragon X2 Elite (Glymur) SoC.

Tested-by: Oleg Keri <okerixx@gmail.com>

I have been running this DT on a Lenovo Yoga Slim 7x Gen 11 as my daily
driver for several weeks now, on top of linux-next, and everything the
cover letter lists works here. 

Is anything blocking the series?  It has had no replies since it was
posted five weeks ago, and both review points from v1 -- the duplicated
&pmh0101_gpios node and documenting the single-compatible reasoning --
look addressed in v2.  It still applies to next-20260904; glymur.dtsi
only took three commits in the meantime.

Happy to test a v3 rebase.

Thanks,
Oleg
