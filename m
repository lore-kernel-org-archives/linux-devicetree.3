Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530246;
	b=vXAth1fAWCD5itKkl3noE+Yj+V9aNBOxSAVgM9jGK8sKz3A9pNb7okIn+WjZZ6ICbeCm
	 uUUrT8GcShu8oOuiBMgT4tlUTyviO285v8dO80zWfoorDGr8Lh16AnnzD1O1/bFdWw4QQ
	 1rTJ0UtW2SJqb3vUaPG1Voseto2pQrE3w/VN4te9fLQFasAUMy2DNJ/BfflTPY5BELnZr
	 O1CNNABtvQ88jpXqswmcvgFSlT5CMB/jTafexhJNvRawDWZocQMsDZ0aEWoVZPCXi4tPN
	 cnVPW3I+KEJkM1ILOal49qTnx8W1UnZdSLF3b06XM3Kv5y83q36qbHd/Q048G3osxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
	b=5ghYgqPHx5+SpUCaCjPjXuOIW2F0hQMCNQRxi1uNKsB+3dCxoXYrjfrWa+32dEcB2NU6
	 fZmeozbxltrF6Rw+QgEDE5iH6QhC9t5a/ir4KHWJGQUxoxcfrCMEu0DGy5TAZcyWBRbem
	 EVaRpudAdK0tn/Ta3moBMCg/EHRoTe7qIkmcKR1X63geYxhvc2bfJL9hSQ5niiIINSQFo
	 foGl7pzD00lZz4jKAzVzBRqqbQi/Edvmq0wol+v6KrCWXwrB2aeYr9zbC+YEQ+KMKYZfm
	 vD5JOste9CglRO8b6hfUcko2+AHcLRUBP+YVhK/YQwFyKKkn3ebEJzNQFwWl4o355bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73F606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C73F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso907471866b.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530245; x=1796135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=mJXpwd15LM06NObvBG25I4p6y8dwPNFq5cNkKyqHfA8ddIlk1uVMaZcsVBLcfRtCqZ
         Yx+WmXrCx+fx/N4DpX1uWPcHsrX9WVlNyigMDuhn7uAMsJ/CSmqaBilO7c4ANdKhz3SL
         pwx87MGelSHlPrBUv/UTDsdqWt8KEwVP3NHe6HNkqV5HUMIp4aDFM0Rh7e/ZaFvr5bX7
         sjls1tUx/QmTcMxXjq2DCD1gMVDgel03IVZBUII2r0ZXBUkCv0DYhfsoLjmJMTaeiKZg
         DPKlzQg7XgG7Kf6rd9E5DHo8oIJVx6HkM86xdZjzwydyO36mbWJRyIbyvvOum+Oakzqc
         RgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530245; x=1796135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=ZWRTAu4W7bhQcjzHC9q8X7XEao/C2oZ9MYHSu6o9DOF4Yz9EMSKYgjkVfaAM9Y9QXw
         ROlcIBpDFyMOsAXbOH6YWRn2ST21I52jcVmuoXlEajqBIhJ2pPjVgf/WF32IQ6U5YbIX
         orEDmkeMYQfUvPeY7QhJcw6IP9ag4Ah3f78RHzmu39RWrNFbFLzS95kOqQNNcyEvh4t4
         mQSahSXATQ0lIfEC7gcC1keTWcV2qEar6gQct5dGKMd2ylFrD6JgyVL+q9HH3C0Wo5Po
         JOQMZmtFsohV22UeE4qSCbJc1XJDiTzXS+t88ufdwxk+ZxnoOpXE2R7P67+9qnVtpMfj
         gZ8A==
X-Forwarded-Encrypted: i=1; AL+hErGg5TGsRj6IpCWwH5UBeYmA0QJq5z5DOAf/S+Cr5ig0ZeaU7qC4AMSB1SKdKTws7by65cUkFjhjTQGF@vger.kernel.org
X-Gm-Message-State: APuU4Z8uuFtbi0NUK+6g8nmqsR3tCQdEUm76fowZ0SRhY5IIlMTEN2s6
	SZuS5jTD1Ctq9dhU8/Ciih4LuQJ0VF6iZkcIZcNvjyZ1h0RxzVTXfIoN
X-Gm-Gg: AZFdTZdNcBfpXZOy3kjZivhy/vlnP0l1O5FC12KArMCj0ammltBxBRvBWtM5i/TdWZA
	xdhnbAPELaRXQVdWM8czfYRZXWUhBDDJnfx7rZkSJujTgTrmhNNnq/3Fxy00dLwOdtHzVbIY+5w
	TQzEfeWiL8vKDey0QwpqtMXhfPNmxFg7fflH72WCvCGNIxuG5mO5ArhASXzOz2DapD5v5+VDbDr
	8P8XpcxtdOc6gR4g62R43UZP/GGo2i+eO1AQ5VElzZQS89uzK3gsQvmk3UiM1IYTIhYX771uXoC
	vjKMx2FVvTpOBt9XZQ2xnCITfIhnZuc4m4q4PilFFUoy3ANSnzF64K9RjDqkSBkUSiCFJHytBvI
	VKUzfJ8KhcrKs+vxOqCOXidfmCRwlfuA+0e09JszUdj6Is5uNw5jR1g6M1t1daYmxQxDTzmZ/Cs
	BtqlwGvnD3mvNohPoZsKOona/V+K5hpVbjquhr5yVfNlZ3M1Yoc15wjDjiy5tGtR3OxRjVROtu1
	tRLANWd4n8/C/3IBUepZqJWyMR5k7vGgWJSBFRFB4K5dQjHRg7BfCp2oPiyq0p+TPu8OS7cO+gq
	CWiasCNBf4hPZMo7l2UmBDzkmE0=
X-Received: by 2002:a17:906:c53:b0:c4c:c62a:b9b3 with SMTP id a640c23a62f3a-c513aaacfccmr893924566b.22.1795530244720;
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm525653466b.11.2026.11.24.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Tue, 24 Nov 2026 14:23:51 +0000
Message-ID: <20261124142351.2137556-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws> <20261123195935.1046144-1-lightofmysoul@gmail.com> <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
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

On Tue, Nov 24, 2026 at 11:35:32AM +0100, Bartosz Golaszewski wrote:
> Here, use this:
>
> static const struct msm_gpio_wakeirq_map halliday_pdc_map[] = {
[...]

Thanks for the map! I have added it in v3:
https://lore.kernel.org/r/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Stanislav
