Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCF3B47FF;
	Wed, 13 May 2026 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699381; cv=none; b=pVkZKBqRwX+iatf06JGqXGJrYqX5f2rH4vjO4aEPUEi9SzU+aRntApb83zt0GUaNo6rRx9YgIv8K2rFUvCDnnL6MK+KUa63BEUIZTJm3ufcMNBRoipY50kEVAJ6dMKlGjTRwyPH+y7J8+KgJ5H8vfOb1IDSSnDU/Ig0q2KoU9F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699381; c=relaxed/simple;
	bh=B52P1bZ2z5CzZy2FhrIEMSN226fOFh0i/6RmSCve6UY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsfBkBHgHOyqCjnAHDBnmB6WQs/TvDTq2VvJlvmnexq0qgKMn55L3R20DjnfHb9jIoGOJC9425v7BuxoisiXERF1hW/uv+ZNOWw9GtRdhYJgu5Gt/p9gi3MiLwH5EDHfWiMhQernhOBg+0m9Fq0i9z5MCqEXIrv5PynjuW272I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcqrNxGI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcqrNxGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6F6C2BCC6;
	Wed, 13 May 2026 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699380;
	bh=B52P1bZ2z5CzZy2FhrIEMSN226fOFh0i/6RmSCve6UY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QcqrNxGIgfgw4gPtwXv1LoFSajy5PCddqYZV+GJYwF8TiH45P50KetJLQQ6zsjr0E
	 TVuBhKvfNkDAdg3+x6CfNxoSP30QlK4ABQMYLdbScShZQpLb1xhpLp3iEqSqdK0pnf
	 n8bL/FU9HVL1Jqr70WtTmzl7pWE9K/V/QSHzZPKXOfDr0uidhcvnK6fTnB9NP+s6SZ
	 UoMItOvwcTeTY0RrGIjdnmeCzh7YMyuxTTTxfT9aOBT9tMimU9axHpCFsZvc6uxsPP
	 LOhHnIsvnBm5gpyn7PLql4MTROB9LytxL8sCwzNR/bHBzkOe8AzSjU7Z5ABws9AUoM
	 YHSjZFfIUxohg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
Date: Wed, 13 May 2026 14:09:21 -0500
Message-ID: <177869936443.1496622.2068508194790536289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Mar 2026 18:56:46 +0200, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8650.  Wrong clock
> parent will cause incorrect DSI1 PHY PLL frequencies to be used making
> the DSI panel non-working, although there is no upstream user of DSI1.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
      commit: f4d7c5875a215cd3989b59d13a9c30cec9f0a33b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
