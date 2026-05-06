Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2A33B967
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096068; cv=none; b=dlfaRbGpQ6aXU3Q0Z0A8HBAnYn4734azSY/Yckz+7N8/WGeWUVnrTxhdhqyHo4WKB0GgWJv5O6+YdH5wYuZ5lSxz18Uv8GKq1KhdHNlRp6tD9owhpsRnXVhRb1KHtYqoe46MMOT48FKuWIJ8Isyp6rupfwsWs70rUOyuw5m7v4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096068; c=relaxed/simple;
	bh=G9Xq9sd+6bjzfjcLh5R7mw658ItOtP/fk9pwzabCi8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXmKq8BSv8Cr3MEyOorBkya49YCkh0E7nLRllg9fzq8sR0Eqxbg0O/x7QuFZ+xgLpYPfB4fImrfTuRvmf4vQD54cZRmjsHS0PA1Q2LyohQsWqi6K+K0SQdUvVsdHo/6UDkM4zCw14FVGa1BAcYYXy9HMMnlUJ/7nyy1e6fssUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7p8Dapl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7p8Dapl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-448528f4e69so43763f8f.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096061; x=1778700861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gS4y0A9iirAPQF6+tXC+YIwa/x1zAzWqagwvhjVFdBI=;
        b=Q7p8Daplb5RprJVJVbBQnuRUbZm/mCnA3ZLpUmYTIr1mIkPnZrMbpycJe7LAMGbmS3
         PrLloQx1eK0j+MeXmakqOTsGplzgnbEAXQ78yDDgpBA1o/cj6tyvMhGioUzkjNMHIiwI
         cKiKGRFOmgaNJB85oI7LTtSy/U1gkq9UZ7MJSjG2UDV+fqbk85lyR8HBxk5eA3a0sTii
         ceGrHDxBxPR2ChDnX1LSiexQZf2b4B4ya3uCQ37ncTUkAcprxBaPJk0fRRZvgIBRANqe
         HA7gitdBx4JtsuHWQOrluGz4GJz81YGMIbopNJD3PLxjZmZYkbX2m8K+lJCjJwtIG1+/
         GOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096061; x=1778700861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gS4y0A9iirAPQF6+tXC+YIwa/x1zAzWqagwvhjVFdBI=;
        b=U7xrENS91/5Qxz0Hb1muTViJM1aC6grQOgXJWWytFO/s3no9CYvnwdxiSX2BTMqW8D
         9yJlt+P7kdcjQ8hWjhyYiMO3DdLhOQEzZIWppZ7+V6UGLthgq9D1AwNtpMttvRjcrADm
         sXt09Ue/Ng38H3hN8CpeG1LPKLP7O15ToAb9131+Tq2uGxq93NwRuAWPaoAX6boyX1Lw
         41xLPhFwL8oT1mFYnInFTsIv91HVEbou3MElYSuLcDDrpHynSgivJ8kyinJIoS8Pg8M0
         y7pZRS/9VR0PrSa9tQ8D1R2OGhGXmz8R28K9g53itTz2JqXi+xnpHUilj6iFy1iCv6yC
         rcKw==
X-Forwarded-Encrypted: i=1; AFNElJ8BToFO3NhetVmHqgkB/L91ZbgNGR58noRbPx2XE2VnRtHBjLSD7KbzbEUSLs5Y9awdKM9HP0brVvv1@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCm/CCj+/YjavWupAK8MYRPn9up77EZo+Ea8O8U+TjE9QeQWb
	Xu/rrSGRZ0GimSGqwV3BXBhjYyQx6XNP7rhSTotdkly+FKf4E/cNpWN5
X-Gm-Gg: AeBDiev1xnjPXkhZxv+aMwkbbqxu7mTUDm3DmZ16ShfdNACy7Ci2hV2Qde8kZiACD+A
	82d9PQCDLGN7U/y7OvCEnHCQi3vbyPDdzTUn0f4gEwVNL1Zf1bPmcpjMEpi/zMJF1D6051zl0GI
	Azbk6uKI8QTKzZsqywy1ud1LRMdjxuDB6xdGOx1SWEGbpJkPKKlhopKPTZBFeloH9cBRbiRs9Is
	JN4LVUh9itTV0hLr7yo+dcuWtEMqOjjenET0LRPP1VYkAxRCfP3g+CBujg/6S5OcaW1lsyjnKti
	zUi8I/CDjJ5+hfd26IiGgumAtdu/pQihRJw+IsUS0//IEj+jzYB1QXAMccaLJIJ0eSM5ZN5ngHd
	NtYmyg0FnXdBLspL6Aihn3XOOWAXvjkAKIXYIJVln2DvgnesEAGu4ZEZ0x4xs4viCWbE1YcEXWi
	dgCp9OjjSR47f0urnJ9XsfAj94v8jRVRZsjmAKvVUg908=
X-Received: by 2002:a05:6000:61e:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-4515d5c62dbmr8130105f8f.35.1778096060617;
        Wed, 06 May 2026 12:34:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:23 +0300
Subject: [PATCH v8 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-6-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2692;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=G9Xq9sd+6bjzfjcLh5R7mw658ItOtP/fk9pwzabCi8g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eW6XFShsEbvickZ5UqM6E5AMKOWZpit/c5T
 28CQqM8q+OJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKthA//dOP8gGnDvZOJKjesK1+9mAKL14rxHMC
 MbFWuaURLvKqqveJGAQhzIfj0IkXo/MUKHJ6ZWF0EkJ0e2lUGcoVplpyE+du7MbRiEVCMpweemz
 7U3549Izr/d0hD48eqAEfVrXYO/m69sfQRHBKn3YY4bTUa6NgWVxwtark24yeWWweZ5wCFpwuDe
 7S+b7p2huG1vzQO5eIXJ0zaLddeSElRgHchH8j5YfJT1bnVc5/htntO+xdQMAjQgp+1BWOLJ8sa
 h/3NSUXQHiNlE6qGUnix1O+TCTF61wbgP81Las5AKnfu8ubPeZXe3U5t0d4Qxsg2gXGcGf7IGJ6
 JHPBYtEtoXnjZHtSXhVl8CFkB+Gb7VEU9oiZ0QLQ+lbom1o1h5+BDHc2jT+iP51Od3PzYK7pz/7
 xvgUKmJcRobAf5jdX9K4WmOFfWD9keLiGBm4Aa3eLZ92au/6QO5Hq17kKmuSSdxvsOz0r2Sa7KE
 EU0DoqmHPTk4MybIilkwwkDJvhnhOg/DW9VI/RTjSFP3+e33bA0UQ6W0/eIRvjtrICZe+++KQrj
 FltFSjrXJ+J2g6O9u1iRytS/Hzx/yXB4zYZi68veh/QmV/kDNQiucJbpK6HnfkWQ1CH6OOAGnWi
 6/vKNtId2fLN6rtpfFwec4r/iin6t35K/e/Bw7L7hny4L7oC6F80=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This enables existing drivers for hardware that is present on this board
even if it is not present in the DT yet.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes: v8: Remove BINFMT_FLAT. I have no idea how that slipped in (Sashiko)
Changes: v5 to v6: Regenerate the file with make savedefconfig.

An open question: What's the appropriate name? zx29_defconfig?
zte_defconfig? zte_zx29_defconfig? There's e.g. stm32_defconfig without
an extra mention of STMicro in the name.
---
 MAINTAINERS                     |  1 +
 arch/arm/configs/zx29_defconfig | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0b774aace55..0b392a364e32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3777,6 +3777,7 @@ M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	arch/arm/boot/dts/zte/
+F:	arch/arm/configs/zx29_defconfig
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/configs/zx29_defconfig b/arch/arm/configs/zx29_defconfig
new file mode 100644
index 000000000000..b7f77e7a618f
--- /dev/null
+++ b/arch/arm/configs/zx29_defconfig
@@ -0,0 +1,53 @@
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_ARCH_ZTE=y
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CMDLINE="console=ttyAMA0 earlyprintk root=/dev/ram rw"
+CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT_PLATDEV=y
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_SRAM=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_PINCTRL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_POWER_RESET=y
+CONFIG_MFD_SYSCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+# CONFIG_HID is not set
+CONFIG_USB_DWC2=y
+CONFIG_USB_GADGET=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_JFFS2_FS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_LL=y
+CONFIG_EARLY_PRINTK=y

-- 
2.53.0

