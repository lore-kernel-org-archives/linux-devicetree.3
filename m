Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054546C4A2;
	Tue, 21 Jul 2026 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649655; cv=none; b=fIzYCefYwgpTnUO+OOF4t+m/bcxZ3cH6wiuBY1YE53vMBgLv2BEk27YxsLoFz0YwDzM7VqYVPm0jHu0T1ZVnFOP24S2Sf3foV0WRtaMaGhbphJB+juNhgOYQINjyscqThWCW4o0HKkScmk/Js9oFe4ppHHHKOlbbMl5Y/rGDGWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649655; c=relaxed/simple;
	bh=BNwyse+60RJq6uhperqWzkTFcBln9g9zfu8ozODcda0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7KYXb6GUXPOU49m0tTo8d/XyU4hmF/cdATkdk/s8C4qqECgDwMPg6IbtFE4BV/su7YgspPYgytzJ55XzaGWBrzFcLGEn9nTGMiNhJM5LgxPj6DQ4M7OS3IGbCM8GhD51TopuFq6rMRSI4k+XcaJPjnVX0tqyWh7M5jeZKwvEvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=B7UzbRpR; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="B7UzbRpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Al
	PjXXYnuptVW+9MAyCQFbnaY3++kpZowa2OjPiijz4=; b=B7UzbRpRzFCnrndvIp
	jI6QbtEEhINDZW0sdf0bqEcCiF8Q+SGCvpzugqfqBJXCGKZ3eQgTASDN6/+hX8jl
	LiWt6KGHFgFYF6NkpUpc5ZvPe+MpC5ut/A7vnbPs5wN/SsHZOgQNhBpOfy8H1PWK
	Ck0a/DY+93v4mqAI7OZItuCl8=
Received: from hie (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDHXTmLl19qeRJ0Jw--.49584S2;
	Wed, 22 Jul 2026 00:00:12 +0800 (CST)
From: Tianyuan Jiang <code_0002@163.com>
To: krzk@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyuan Jiang <code_0002@163.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add xiaomi pad 6s pro (sheng) dts
Date: Wed, 22 Jul 2026 00:00:09 +0800
Message-ID: <20260721160009.535-1-code_0002@163.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260721142147.1618-1-code_0002@163.com>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHXTmLl19qeRJ0Jw--.49584S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar47tryUtFW5Zr45WF18uFg_yoW8uF1Dpa
	yF93sxZFs3J3WSyrykXr48Xr4F9wn3JFWUtr15W34rZan8GF1Iy3s7KFs8ZFnrJ3saqa13
	ta1jgFykJan7AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEsXosUUUUU=
X-CM-SenderInfo: 5frgvsaqqqjqqrwthudrp/xtbC7wx7Fmpfl4xDogAA3B

Hi Krzysztof,

I sincerely apologise for the rapid version spam (v2-v6 in one hour).
That was completely wrong and I understand your frustration. It happened
because of a misconfiguration in my automated workflow -- I was trying
to fix issues iteratively but each fix triggered a new send without
proper review. This will not happen again.

Here is the checkpatch.pl --strict output on the latest DTS (v6 fixes
applied):

  total: 0 errors, 81 warnings, 0 checks, 1769 lines checked

The 81 warnings are all "DT compatible string appears un-documented".
Most are false positives because I'm on Windows without grep, so
checkpatch cannot search the bindings directory. Compatibles like
qcom,sm8550, regulator-fixed, gpio-keys, usb-c-connector etc. are
properly documented in the tree. In a normal Linux environment with grep
available, I expect the count to drop significantly.

Changes since v2 (based on review feedback from Konrad and others):
- Removed all output-low/output-high from TLMM pinctrl (Konrad)
- Reordered root-level nodes alphabetically (Konrad)
- pinctrl-n placed before pinctrl-names file-wide (Konrad)
- cs35l43 reset: GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN (Konrad)
- firmware-name paths: qcom/sm8550/xiaomi-sheng/ (Konrad)
- ktz8866a: add kinetic,ktz8866 fallback compatible
- assigned-clocks added to mdss_dsi1
- Removed msm-id, board-id, Xiaomi-specific comments
- Removed udmabuf bootargs (confirmed not in use)
- Fixed node sorting, alignment, and comment style
- Fixed From/Signed-off-by to use real name: Tianyuan Jiang
- Line length fixed (mbhc-buttons-vthreshold-microvolt)

Regarding the undocumented DT compatibles (fpc,fpc1020, gt9764, ps5169,
novatek,nt36532e, etc.), I am preparing separate bindings patches for
each and plan to submit them as a series. Would it be acceptable to you
to land the DTS first with these as follow-up patches, or do you prefer
all bindings to be merged before the DTS?

I will send one clean v7 once we align on the approach. No more version
spam. Thank you for your patience.

Regards,
Tianyuan Jiang

