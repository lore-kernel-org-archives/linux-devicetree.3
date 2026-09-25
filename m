Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECC4D0CC7
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360016; cv=none; b=nSGRFUyyj/YMV1hkEaTlWH8UmBKuIPd4DkAGSuWVbT6dtthtJY2wE/zJv28hHNZoNgKQkMvweeFF+nJdIZ1NhL/I7wJQkT8WNuwJG9TSo+IQTtPZ3xPMvxN1gOvdIuMTUBcSRwb2q/AWWRnZrUnozQp5yHjIU5kV67mJKGWS+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360016; c=relaxed/simple;
	bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATLR5/hq8Q+a8ixtNZbY9Qw5kQjRoFjHn7ay6p9WHPDDZaEYUdANlTkDFhbU4mvCp4OFZqwKi/bsXCoXuU7NEDb45BUSFO2eYuxf7R6wOsCC+dGHnhybdBDKjQZI4Vane3YBIf0JkueK7Z2m+tUOOlAWcSG8/sCSg/wARqnLFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jUgYvHah; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jUgYvHah"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9107051ba26so8315026d6.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790360013; x=1790964813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=jUgYvHahIGtLjFSWGaODdXohLdw7g544iNlxxuLC/HWV+0AnhtplD9xON60klLVHd8
         RUkKXcp/ZBrIBNSRa05aqMfkzhPT/RovLtKRy1t+kvNQOigG+Wboq/hQliV0heKb+nzg
         KhsoHsapwVE6llOKCG4xvtqe46dohfMbTprU9893lBhABvBphuHZtyfAwd6P+v81Q/5W
         xpseYIcf51sEmOy4o2x470L6AhB0aVMU8KD5hnzawpeYRPgjjS9iPNlTqtXqMpwbhyFF
         0YgH7XY0dp+NP4Uf+5DRPOy5udy0toPbzbpwTKmCMejvBqzffHpkgEpphfeByrIvHzNM
         ZAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360013; x=1790964813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=WKhAE9YJfy5yRs0xvs2KBC3CJUvjj5VKFOuWXP9/G6jTgdESvhHJ6SD2KQP9hHKAib
         JyQ7MoLsmHzY9yRb0oks9fQyMcIa7rEeY4z93DyMTzkVxE9GmO/faxykkrMiRsiHJMxG
         xSahHVouoRuS/wy3mtWV2Vk4ZBC6kTd909jvayfytbOfQV5nyXWvn8OEuYz2L7hWPyuH
         MefcqTYPAiU2SNHl0Yu0GkhlV7ORnYS9E7x0a8VpiKzHGcongPAFnNv49GZ+gQgfFNoh
         V0ITlf2yiKpqeuX+K6FQzLPlo5LiOHX93LEGNJtlBzJcsKi4SrJa14HelwLzyHg1BtEJ
         IDlw==
X-Forwarded-Encrypted: i=1; AKwUvBwmTU/TUjTfi0Sua+MH7o9rJK/jbBcryFVURZuR8ipteEqF15lom3dSu3r4eKsUvSbXLa4oQNBmRjOC@vger.kernel.org
X-Gm-Message-State: AFuF++lfq2w1dSUkS53Sl49uPwFUmglqMxhz8U1kgFxxzHeiGj2itIbc
	M2pwdZymhMVzwpKOxQEf14gx9nfVPEAXMJ/KkWhqaHbae9pYXJJM2Ca+WFhsEHWT2+kx2dm1mBA
	MXW2py7hT/hvW
X-Gm-Gg: AYBFou0MQaw9tTYahPV/9TYNYb6pQtWYxVwwM9QlcsjSSu3kioMmszcWehK/K/WNbPi
	0bhyUVWxB0cU28QtmwaFygtMMo8/3nkKMn40slli4DkeJurY4+gtqYcz9hT/rYyR6lIqBrVhJMR
	inlxCTbsL5FG2+TjhffgBlH0W6uLi0AlBPNZ/I6nRcx+Lvv11VoFksCMlmMA+m/ZHUIxFAN2c7B
	SNs0A/tyvJROWUK+qADdf4x1ZfFnEi4kUfF4d973RGe7XcLH13TegyIspm7HjWlCfW1KXQ6hIse
	2q7Ek1K6oRsVtZFkRhO5IGvN84O75vPk3zojIDMkTkCV9uMnLED+cbbr26KYVBsqjMEnaj44Vfk
	EY7aiCD5A/i7AffMT6HcrjLfOLrCXDxvHaWYjEDkvkupYzLXvvA93Ja+h2IMAYd4epu6ofJUaFS
	2+ZpC+748m2yEA8k4EmWeuBCt+7r59f+9BRTGFC9lYsindg9Y=
X-Received: by 2002:a05:6214:212c:b0:914:433a:59ac with SMTP id 6a1803df08f44-914433a5edcmr9586606d6.38.1790360013409;
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dacc41sm22471816d6.14.2026.09.25.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Fri, 25 Sep 2026 14:13:30 -0400
Message-ID: <20260925181330.22794-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 14:20:29 +0100, Bryan O'Donoghue wrote:
> Add dtsi to describe the x1e80100 CAMSS block

Tested on a Dell XPS 13 9345, with the board DT for it [1] on CSIPHY4,
two lanes, and the PHY API series v20 and CSI2 PHY driver v18, on
7.2.6: the OV02C10 streams at 30 fps through libcamera's software ISP
and into a browser.

[1] https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
