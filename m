Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5243AD50F;
	Wed,  8 Jul 2026 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522626; cv=none; b=htjGNlzEZB7tcDK+hXzGowbAe4R5+lGHzNyzj+59kl2uVLfIptr8PWic8fYjgokl5ZdA/UZD5i974sVbQCAW+CD0BBPEIIHGaxNjzo+2PmAQBlyBHVdaM4h0hxf59foLKf2C9Bx185cCc+k8eWX5SUYShmAf3iN1UYTr+USuwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522626; c=relaxed/simple;
	bh=UzRfL5nrhbV38SWlq8GKb9sAXDLqfaAxp80Irg4X90c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pdq86vX+NnVZPStcJU5yVgH6LTGmY7UBXP3dpL6IA0uwFDYLIIZH4f1Suh+904fq1FbCsZVIt1bkT8B9rxS0kdIwkvu4RlNL7h2hATN9huE7cxxSYShIRHweH84Ufc11ibdNJuRjGqrmeZcSd9+eVKmI4EWfzKu7SwmexfRZBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqVFV8N0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqVFV8N0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B157D1F000E9;
	Wed,  8 Jul 2026 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522625;
	bh=qhL8DDYBvzEg1D2vKj2eStEXxlj4RbY++jB2YiUfGwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MqVFV8N0q0YF3mOV5uba0LIXTLEx5dDKoQy+ZGFrzzPzJt2I1tYwUuMh2N57Ajm0o
	 V79IXQNj5+aV1qbYX03SdzYFOUdY3K3u9jDYD0b6qXEr14zacO+V5GxIAeuCP1rzsM
	 yLu+kNjOLc8VdWlMogQwGyiLatngo9PQoYQw26iaANljxcXbG638eT8e3wETV7zUua
	 p9nC58aKRfd7+LonD/jfKaGIR2reWVDo3++9dvm9u59yrt+gkLljv8L2EK4sN0C8MN
	 Mc/Xrpd1eaJFPNQma7b7O+rVjivoual27GBNexk/86LxUMNAqB+er1PdTfgR4TD2bZ
	 Of6gVp5+GxjVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and MTP
Date: Wed,  8 Jul 2026 09:56:06 -0500
Message-ID: <178352261647.2235436.9683002784544233361.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
References: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jun 2026 10:50:20 +0300, Abel Vesa wrote:
> Both the CQS SoM and the MTP have the following array of PMICs:
> PMK8550, PM7550, 2x PM8550VS, PMIV0102 and PMR735D.
> 
> Since on Eliza there is already support for SPMI multi-master,
> it is necessary to duplicate the devicetree description for each
> of these PMICs, due to the SPMI bus index and address.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and MTP
      commit: 89652f946ae31820b6d2b47df93b7d81ce98cb37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
