Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222381;
	b=Rs3vEJ25o8zfnG9ZNrH2hQPKrlQ/qA4N/H5pZtciiQ64dXuEmTvLD6dPhXJLc3als1k/
	 6tJYu89BfKa82Qm0i4/MrHLLvYM19zVZAqE5bpEdKNMm08DxkLDVdcxxoLy2LMkMv1Yu0
	 cvp01bI7WuCl4ydRFcQFLdmDIE82wJE+Pr31qwPGbH9l9+e3aKhmOpqb8j6Adj1voAOEJ
	 n64hv83enXcb0azXYg39vxGP/NgX692saRi7i98+tXW19Grce8pDK6c8lQQcNn8gvva9X
	 Z4VMsVYyVA0QmrN/VvBDPf25CnsWzHzPsZkKlD2umxe3nqduqUJGFlw8gKv/vlqtlaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
	b=XaqhKvgIFA5DmWQ3E0kszTssBlQEkNGLy94JIjThxgoAFAL2KhtflhwviLDlcs3EwQV7
	 CwtQaeQ8Eb4FPxKv7qE1bhdHPTQ+pRC+YNZrTLVi6Z1mCN5iGI3UGmZvi2m7m6kOozxWQ
	 O94U/p92Tqk+nbddzBBN3Yn3MZPsR/+dAhtHwV7fYCWFKWz1h08i3kkul4HRMK+NiXHwt
	 BAredypg7uMHRvI6Cp6G/K1Qe/t7UxJAuZ2fR1kvGliTbUprVsSduYzh6RKykyxUG2pq/
	 n5WLBktnFwg9Ms8ek+n06qaV+eHMFWx+YpGe1hMXT6Hafeg38tVunBqEguK4QXHaxtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PWjA2Lvj;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B40606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B40606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PWjA2Lvj
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so7369965e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222379; x=1794827179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=PWjA2LvjYpWCVERyEdvhNDTO5CxcRrBdnaCjzXWupoli7WUWCMNDZaJhKhCBnuidH/
         7EyJ1AGyLVRX+J2Yz2kyGpqCjKieVkTjCpQ7aDvTiQg+ED0vXnHrIbLr0RD7eWCOLhx2
         MvjdxwpOKccAMLZjYeMVV1zUHAosWNYch7O9VUE1hiWunFGEdMTFg0oKSCznsiRQycvl
         3p9hAnogHYU4d/k/1wTjDnzN9vL6MEwoXOIr7CknmzgXJZjtKGqFJSHGJWR4vMY7GMA4
         jVCeuohzLSIQ3QzuZ/Ecz9B8I6MgtJgJcAUbsY3AULJdNvBC4O/x+Qtc3WslLbSnxGYe
         6U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222379; x=1794827179;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=UpYCiry04w6fYvPtrYlDTEgg4WMS4IlAI/gGc/0re+MmXJ9wxj/7zomR5aXCP2KqB/
         PON3gZgSu22IIXkOZkeOLNjmmuQgLyYk4t3cJnwWQFPoHTDhYgjZdmxFgUcTRmJ8i/Ip
         hCvsOQY0gZCyYORyWMmW2wK4yAVh30ygCaUfw7a2LOA/W3MsIb68tVtHd7wnBcHU04RW
         dm/O15VGvJO6tpFjmBNEkV9enBJd2EF1aqB1jMndNIj2XiSsQrX206xG5x3f8hHmkCuC
         MoCiqZ0C/za9Z1067iLvkzrX3Lne7Zu4Z2+xqDPbbcoTJbIQtCW6+XP6oWKDvxhQCgne
         ynxA==
X-Gm-Message-State: APuU4Z90aNLBFiAGAx9BI15v58Fkq1MnKy4QKhcNa75CeLRBAUaNZoBh
	+WGXG7ClV69CQQHeOZ37Hl5j5tEwqFimx4D3dgSeh3NXGLD7fCHim2leNJeD+KnwR6Y=
X-Gm-Gg: AYBFou0cxd3YaOXai7CqWivpYUiBQOUh3pg9Et35f65SrcMcX4SGwUox36mAvS/4ln7
	0DkMG9CuGSYFuyvBxwseOmwKS1qRSHDtP9w7CQ04Lvpujhn+qsk87kYeKki3YoQk+6zTGxcfFcd
	I+/7kDuS3qxgGmf5fvANy0KWu8RPHcg2OWnEv+md0lkVG7sTjwVcYNm5QP/R70BAARmfPv+ZwJc
	EcBjvq6Y2Mzd2G/nZP1tH473LeA9EfO6/H7w8Sz1VyK+gLScUGgGYjchmalMNXHYtBi7iYJQTzY
	H8qHfSy0fbxcS/TXIrLZg2IINjhdpUjnjgJKYRrEjMROPYxbN9BxX9bhwWS+uqmjDgI6ptKPl7p
	NXZiO9AMDGHRNGvAeoVspt6ymIT4ktqkUT110MpS1dun+fhBkqNe1Fz0A6PbvTMmXzYG0bRDp8t
	Wch+C4I5+PnhHwfO+skeZ75OJT6L2e1lPLvm8yfKaPG+2fIZG2lOhdHdmXemh+X5Me+zcGia9kO
	tI/o8+PLnyptB4kj6DxgwwFfm7PPxBQSPUjN+3RsRpW4inv6FT75OrDBYe9klZb7UHSitA6lmh6
	4zmlJmWJpIK+ZLZdE7MwZDusi+7xA7f414yc/gEmw38=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b963c87ffdmr68091205e9.19.1794222379267;
        Mon, 09 Nov 2026 03:06:19 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm239723095e9.5.2026.11.09.03.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:06:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
Subject: Re: [PATCH v3 0/2] Add initial device tree support for the Xiaomi
 Mi Box 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Message-Id: <179422237792.1514386.10691096283154842282.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:06:17 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 03 Sep 2026 18:18:44 +0800, YuChia-Kan wrote:
> The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, power LED, audio, Mali GPU and the Amlogic video decoder.
> 
> Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.
> 
> Tested:
> 
> * SMP (4 CPU cores)
> * 2 GiB RAM
> * eMMC
> * RTL8723DS Wi-Fi
> * HDMI output
> * HDMI CEC
> * USB 2.0 host
> * Power LED
> * Mali GPU
> * Amlogic VDEC
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      https://git.kernel.org/amlogic/c/3e965cc7f86b7358a850b191605db72a09450f81
[2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
      https://git.kernel.org/amlogic/c/36f28822232ae35d36ccd2587e333db1ac961ff7

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

