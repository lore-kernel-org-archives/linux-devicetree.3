Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9435C68C;
	Thu, 30 Jul 2026 01:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376546; cv=none; b=E/dHFDkUT47vIS56614qzGIYFerzbPXRzJfLVlUrfUuYw3/9PBGGI8GQlrmCAPQZu4fTJuKsPg4ouG/6PUnSBSZrHOi7Ud0oz8KqCFPtJFIvwADoSIciSTNyucJSMEbmjfjH/EqWPRxzJDQs7fR2LxNr9Qusr5Qw6ZK1oQ730UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376546; c=relaxed/simple;
	bh=qd7As+pk2MjW9kEhtcroleWEvSz7AY4+GkHj8umqaOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OCfyXLqH+SwfIvI6Ca5Stht9UL9ee1f3LpeEGzES+fiFCmt36B5keoeYM1YCPaF9nRBM67jncD6VEop5HqI0BaXUwKJUXfr53uHqv4OzfeeS5BNY8+eXED7a0PeExtctro8IZkT+WSB/dmFoDWM8aVRrHcXLK40/6OUZtuen2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maHA5WRw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maHA5WRw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE7A1F000E9;
	Thu, 30 Jul 2026 01:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785376545;
	bh=iNPwPKARCBRn/aqNRal4OnVcFfamREuOT1MdXgGt2iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=maHA5WRwb0PtrBwqJMYxBOqMDbOg8UWNXtCZTUnCUgFdCIGG6lKGsO98w3w2vPFux
	 Hab7HnnFSWsTHTTDGWYgeK8rScSKuEgiVgca/e+nakivyASFmq7LGyN+7Cgv15q4KI
	 PwBC6Xjh0F2HI3hU5LDOI+yliSgAoUkO4KEGElRhqUJPhTjT58VKzsFyG1HTMy0tR/
	 fixE61TRo043UIG1EAAxf+LqNCs7E1P/LinfMD8TakCJCefwf77aL/f5/IlLYcUMhN
	 wyZRpS9cujSjO4utLTICJbh7apxhs/bbG51Pg4G0cP6g6VoHe4xFsmAiTQ7Q72nN1i
	 9NDh5wunfwiIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Describe the ADSP GPR node
Date: Wed, 29 Jul 2026 20:55:36 -0500
Message-ID: <178537653470.67965.7507667859029113644.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724-dts-qcom-eliza-add-gpr-v3-1-2595beb0cdec@oss.qualcomm.com>
References: <20260724-dts-qcom-eliza-add-gpr-v3-1-2595beb0cdec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 11:25:45 +0300, Abel Vesa wrote:
> Describe the ADSP Generic Packet Router (GPR) devicetree node as
> part of audio subsystem on Qualcomm Eliza SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Describe the ADSP GPR node
      commit: 23da74833df803c5e8bea71feb878173764ef121

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
