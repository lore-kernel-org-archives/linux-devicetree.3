Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760213C73D9;
	Sat, 11 Jul 2026 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788049; cv=none; b=ra8qTtBV4kIzOzcihcCGRlXg4zIcnkragvmnLlFptb4NMd1i/Jmgl/wuy3ACH3tiQb20aGbYKQWV83Cm0TYND1fbpyQsYDEMz0b/csEJ/rBx7IuaAJ5CO6oirDCyGLoItnzvoABnE1oDF+S7NHKZ20ToGnXrI4auyHffANuZfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788049; c=relaxed/simple;
	bh=+sZUPIttqs9OOlvVHyEA3zAxYzZl5qOOzyfupbw+y4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxZ4Fg95t0FOE4j5jPMG5IslUI/W+Fy73jBfo+I++M13mQp4ihFSexUdV+OUD5qDi7Juaxq4ZJ3p4vUMbuqWXCkFlus1R7FHssG0RpohfXEO0aBFQnNZBWqJoPDnoDHk1KFKkhaBf9tHxafl6+Z1ALApjakqGrhU+opK2h8SThs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGiQkifw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGiQkifw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D571F00A3A;
	Sat, 11 Jul 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788048;
	bh=ZV482qvBInsgwUOj2Lcc6ja5ha4DX2pHN8SYOWTNGKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lGiQkifw2VxcJfR5u+Rrx/PmXE/dQPGSxvDWxpiJ9ynuYTkk0DSepFhk+knp1X7XJ
	 7pJz+KRX1JvruDas0fweUwy6XJav2JqP4FhGjcoGs/4885cbXk4BGEy1wOZmiuTLnI
	 9ClbQOfFZWrLPX/aAtwSJ313aB64Q/3wz/iOlLcM4ZiKet9qN26d79Y++Y91P9lNIK
	 /VkBZ5i4ECxKvOSK6YdVjxOHMfodAaY/P2MZFz/n6cRhkZknbvq+6u4aJFuKJL1Ib1
	 tCsbo+7Sb1mxoEnTsK7slAN/m7YA7NbSdNGd3cwE3StRVRUN+KAj+BufEARiYkZFgi
	 fqajA6WYpRWdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate &pmh0101_gpios node extensions
Date: Sat, 11 Jul 2026 11:40:35 -0500
Message-ID: <178378800457.138068.3698006090856501517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
References: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Jun 2026 02:48:20 -0700, Gopikrishna Garmidi wrote:
> The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
> extension defines the nvme_reg_en pinctrl state for the NVMe regulator
> enable GPIO (gpio14), and the second adds key_vol_up_default for the
> volume-up key (gpio6).
> 
> Merge both pinctrl states into a single &pmh0101_gpios block to avoid
> the duplicate node extension.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: merge duplicate &pmh0101_gpios node extensions
      commit: f6c0a3b86a40af498b5ab2c78c0d6dc9ab1d2948

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
