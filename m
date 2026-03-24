Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155840DFBC;
	Tue, 24 Mar 2026 01:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317386; cv=none; b=LO3nPmrQudQbEO0viC/wNeTnDoIc+m/ZkWTIzL+aif/Qo412n2KYZTNhMIh8zIyLuQ/hid/Kxt+32MXAGZ6qFOObSjzw49uBDvkZCPFUqaeTOLxlaoD8Y3wU/SpCapgatKmxZVofvzPE2hO/04gPybKSo5d6LKjq0gIeaEEf/10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317386; c=relaxed/simple;
	bh=4dZNVIS07erY1Fvkufx8TK4+GaiH7D6/KGumwhXaUZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=StmF5gS6yxcrUlpcntqchZffOhcgcuy6htKkTEFntW1Ck0X1b/kjVbc18NFWDVSh3Boe6ucErZTC095/jtrQqMJdfHL20ewf/UiBclpuLdwKprKha3H1rdIj7vaI+sNotkAkXnvT5fBlo1Es7ui/u4ON5rqWp11+AzLT4xjVEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSSibS8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSSibS8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDABC4CEF7;
	Tue, 24 Mar 2026 01:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317386;
	bh=4dZNVIS07erY1Fvkufx8TK4+GaiH7D6/KGumwhXaUZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qSSibS8Qpm0tmmg6+r8r3rcJByuiGMdhKnYMjSg39F8VfVmyIP/uZn0hAaIsLfWxk
	 7lGI36nF/3HGdhcgzykbYKvcq6p3KO5BD1gS7h1QQmhrIoGrdMRKun2fw5btTw+PfI
	 AjnW6FBQdXOdfHdTLMJMvHxJvWX7HzO2mGQNVwxzAQKl/QorxPDbEZ5mzKcZs6oAcr
	 Qoxhe+ZVpfjSPy4E+3KZwdeK8PqM0BjSaf7t3Te/n9fbxcK0I8fhQa+72rLt/7LEU2
	 /2yTpxWMe21MzlKCqL2Emfv9EbXh+vS0+HTH8b/KyMvXcCYPe0clcMd/yylXbAEoEc
	 P1qQlPMXMEM9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/10] arm64: dts: qcom: kaanapali: Add more features
Date: Mon, 23 Mar 2026 20:56:16 -0500
Message-ID: <177431737463.23057.3196217288641404686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Feb 2026 23:19:15 -0800, Jingyi Wang wrote:
> Add new features on the Kaanapali Platform including:
> 
> - TSENS and thermal zones
> - CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
> - QUPv3 serial engine
> - ADSP and CDSP with fastrpc and smp2p
> - Audio(enabled on MTP only)
> - Multimedia clock including display/video/camera/gpu
> 
> [...]

Applied, thanks!

[10/10] arm64: defconfig: Enable Kaanapali clock controllers
        commit: 25d676e5b595249f0e8eddc596d6a65f11ece0ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
