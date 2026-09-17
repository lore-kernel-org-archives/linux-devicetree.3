Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56E3914F5
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678424; cv=none; b=npe/yc3e74NnVPk0ROvR678OX+RGeYMivqsAVJsr8ZE0G+jgm/HWr0lef4++PhIG0QDUIEqtFBCrIe2EnyDUGlK5CWpS1J5C9uATkeW9jhRLNRucsU7VYkUDGlI16ydxG5lNukwuEUBi2tAjRtmLLVgvioj6rRKh6C2Nl93Ws88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678424; c=relaxed/simple;
	bh=X7CO8plt9rXRb+sFi8w8w6XkMwhE0mA/u5iv6DISDeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sX6WA5uq+6z/vqrEjgCSIHHhdKN5BQeOCyfpT76xaxc7cLPDNmlY5TdFz11zyxk0olgxvGJsOJHwCzoYSZYzMadntgGaNaC+PPuhdI4DqqaztMfRpY01HJuHShOdPglDBWq7c88++v6JUC7ygjnqjz9N5NNAaozrBxgaxQ2fHgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faU8feak; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faU8feak"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so7173e87.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678421; x=1790283221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBjt8nETg6odEPjXmUPOag2PgcmXewPZyiuP3+CiCYA=;
        b=faU8feakVb/GyEsMSPi1bDSLBoN+ijyeCVANInrwP1Db6YBbWv2FIRb4PMdAA7EyBy
         AHJkyM+v7bypy07QhbmmZ2ce5+TYCTBSQZ1XNBtxrpXCTRMOHffExSPsVEzZLkkBfFcO
         VbZTzOMTt9I8L/MruXS6f+Fj+9g+8Z1aCo7hh8ZohKmi/LDKVfZrTRmKNu06VZh/hZtP
         okmXgJup+iVhI4Z9Jd7RlyUb2qAWMQ30WE59oa8yqzEMvZUrB3ytN46Py4ZWcXgeKInK
         p/rNweyjtOpQsJ4p+LhjPG2O969BS+eJnkn8d3HF25XW1IkrgpCXfj3PY0vPRrKAN9BD
         VQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678421; x=1790283221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBjt8nETg6odEPjXmUPOag2PgcmXewPZyiuP3+CiCYA=;
        b=IJgHBwS41MYCRVaHntoaVFM/+4zAV/bFMwWGjDmJX6YOcyHJe/DJBOXyGZFdPwFNty
         odYQh762OI9Pm09qRKTcYre3/gJZizAlNiQsCYwa3FdON8lm8TGyerk22G9XI8hwBWiN
         pqi96jh6tDGrs+tF5nLyq9vSBRf+xnFVOmNqH5k032DNZEx89cuwoYXYFQygaDCT6bCR
         6juVUI3LCX1X3hHDkObYbOYUo+ldTllp5MARiGeexeMvBUqVU8AEoMr8QHpqvyILeSWM
         WI8tZGXoo1SQy8s+cLu8wOwl/60zjte5eEblbsJQw1lhFkgyTJVQ0fAQpHb6rAShg0+t
         pt0g==
X-Forwarded-Encrypted: i=1; AKwUvBxq4dDmr9tIRB4qxOX2BnsezQnL3PaHjduIhKJxejP/nDSEvlZrntqEHfyhQXSrUwVgxSjUKhE4Bl/j@vger.kernel.org
X-Gm-Message-State: AFuF++nHLu4ZIoRn0lQTzZHpIRtDQPPCvYs5va7D1qkMHkN0+uGL0OAB
	JY+e/J0TE5Xsv8XttlUVCQLRm1k/w2SCc2zCQ2Yi2yuRjdjqt64zBSRI
X-Gm-Gg: AYBFou3KAIw4tOsWftXUwzFWq1OysX3Y9lAZhxYNBERvpOv+cudL2h2VgFp4HbbvoI4
	XI3iPjQ/afsYcE3TEaf1vVgv/ALc0i0Tv/+/3uMpfzyqS3wXBm5/lQqPdAHsBSjMXGqXXBDhiRZ
	q6AF4Bsui7EK2/0TbqMKV0oFVeZ+bxggZi0KHHx8yq5WzC2MYBd83FzKxReQc22E2wDb8QIASqk
	1vb5FrfhbSjxESbOlxbP0CX2uKr3IBj9ja0urxdWRWSxKca2s6e+91s9nkZrG69QrZbcObElUic
	mWsPK6wAIzAew1TlheB4Q5TNXjfd3Io7InopgHKOS3xL6V6bDPKLTXvxugtWtxVqe0elU9w0YsT
	da9P/R9N3ioVheIu7YjHQegV3CaZO+vxBW5m38yjUvLqtakKKzedbY0AvKkynPN2fxsHv2SgQ7m
	TmLHwWccn2jV7SRmU6RCK+NT/9S9ahJqRsf1i7hllTGN1AtkwxkMMig79YvIfL/GuJxs3Oynb7n
	uNW
X-Received: by 2002:a05:600c:190b:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49eb73309d8mr172142985e9.12.1789672289184;
        Thu, 17 Sep 2026 12:11:29 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:c13:5a93:c17c:533d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5295fb9sm1057055e9.4.2026.09.17.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:11:28 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 22:11:21 +0300
Message-ID: <20260917191123.592659-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <458017cd-c188-4e41-a93f-bd6bb123179b@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 20:24:56 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 17/09/2026 13:48, Daniel Matyas wrote:
> > From: Daniel Matyas <matyasdaniel005@gmail.com>
> > 
> > drivers/staging/axis-fifo/axis-fifo.txt file described how the
> > devicetree of the driver should look like. Convert it to .yaml file.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> > Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> > ---
> > 
> > Sorry for adding another email. I got locked out of the first one for 30
> 
> I already you no and provided previous discussions giving the proper
> reasons.
> 
> Why did you just ignore that?
> 
> NAK for this and any other future axis-fifo stuff like this.
> 
> Best regards,
> Krzysztof

I am sorry, I rushed with v2 without checking all the replies. I will pay
closer attention next time.

Thank you for pointing me to existing discussions about this conversion.
I will drop this patch.

Kind regards,
Daniel M

Sent using hkml (https://github.com/sjp38/hackermail)
