Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0356B67E;
	Mon,  7 Sep 2026 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788821780; cv=none; b=tsJ4t4sNKpKSvoZaoOfVwBV4aQ3pr0kfAfSRTsX3mbE6chnOO8xYttfmNxvjdbxbeXsDBo78W3qBU7TBc8/dPpBPCCW9xnz29QEgSsWoHrHxUWvEyg5WZZ+kfGKPoo9s+ntp1ArUuGJPtMxrnVDzUucVCWc6LdbE1A+8mZJ79CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788821780; c=relaxed/simple;
	bh=1myYtBfmVzzBpAFZon9YktDL5AucBVrY+1WL33A88Vc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QupsoM5VhEsa3KebNItLvHpN7vMJr3ChdtKQhRFqVvjtQpTYxXa8Y2pw1HBX7wSwq59ciSrsZYBKuySg5X0oPmvrsqi/6XlB4ua3wGjmJGyayzgZ+v61JX6mJvshMIhmvg/UKqFuAKHOMwpz+kM/Txscl2H8VvvMGYcvupna43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OJc1S2+Z; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OJc1S2+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788821768; x=1789080968;
	bh=iz4TxbUbopqKEFs2Vy9SbpTywO++j/Oe8Yg4YbGjIj8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OJc1S2+ZWxefbaqPyecNjp6sAaBs2nsflec916xofaIbv07onN2YxEVNnt418Rp71
	 PNi7sd+pWDhfiqrK9nkCu5aGbJ37tVkEEJ5iei148t9Lfwb/FrWqOTS5XscCjG6/l8
	 wSBUYqxDiNesTa57wtj91HN1M5SXb8aKNxE3cg0QslYP+CuM1mWlHXlASEmQUELnBS
	 j8EFVa4oEC9AQCnPC9GpjEs9mGYc5nKxa7fgKeWvlKHXAxjqUagS21pbXzRAy2sR9Z
	 0DKCgIiO772pY67i7j/y1vcVRvNHgEfO3RVrJKy7yFgfNBLN8TPHhyExTGwQ33QLRB
	 xQnv0vM2A2BUA==
Date: Mon, 07 Sep 2026 22:56:05 +0000
To: Daniel J Blueman <daniel@quora.org>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Birk Skyum <birk.skyum@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Maya Matuszczyk <maccraft123mc@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node
Message-ID: <20260907225557.73539-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: e4b872f423469bb3162ea6725c9e1e885a352226
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for working on this. I tested the board wiring on a Yoga Slim 7x
14Q8X9 (83ED), BIOS NHCN62WW, dated 12/02/2025. The EC is reachable, but
the thermal-capability query prevents the driver from binding.

I built qcom-hamoa-ec at upstream commit
1b04f556e8428a3865a95627ab7a0acb5d9b93a5 as an external module against
7.2.0-1.1-aarch64-ARCH-camera1, with your board wiring adapted to an
isolated DT overlay. This is not a stock-kernel test. The driver source
is still identical at current master, 28924df2a08f.

At I2C address 0x76:

  Firmware query 0x0e:      03 00 63 00  (driver reports 0.99.0)
  Thermal query 0x42:       00 00 00     (repeated reads)
  Probe result:            -EINVAL: Failed to read thermal capabilities

Instrumentation confirms a three-byte transfer, but the leading payload
length is zero, not two. This is not a valid report of zero fans.

The legacy interface described by the public Yoga DSDT and Maya's
protocol notes does work here:

* Writing 22 01 and reading three bytes gives a count-2, little-endian
  RPM reply, consistent with Anvesh's pending RPM-query patch. During a
  bounded 44-second CPU load, RPM rose from zero to about 2,800 and later
  returned to zero after cooling. Maximum sampled SoC temperature was
  56 C. No manual fan command or temperature-reporting loop was used.
* Thermistor 1 at byte register 0x29 rose from 37 to 44 C.
* Smart Fan register 0x82 read 0x15. A six-second idle switch to 0x11 and
  back read back correctly, with 0x15 restored. I have not measured the
  profiles' effects or reproduced the ACPI setter's thermal-threshold
  update.
* The second RPM query returned 01 00 00, not a valid count-2 reply. Only
  one exported RPM channel is validated, not a physical fan count.

I published the exact read-only hwmon test source, focused logs and
protocol references here:

  https://gist.github.com/birkskyum/59318b36f45664eff3a6f9be620c8afa

It exposes fan1_input and temp1_input without changing EC behavior, and
passed three unload/reload cycles and repeated reads. It is only a
protocol-validation experiment, not a competing production EC driver.

Would Lenovo-specific match data be the right way to support this
interface while retaining strict capability validation on the reference
boards? I can test a proposed change on this machine.

Separately, this failure exercises the SCI cleanup Anvesh agreed to split
out of his July series [1]. Testing just that conversion, with logging,
showed:

  EC probe SCI enable=3D1 ret=3D0
  EC probe read cmd=3D0x42 ret=3D3
  EC probe reply cmd=3D0x42 data=3D00 00 00
  error -EINVAL: Failed to read thermal capabilities
  EC probe SCI enable=3D0 ret=3D0

That confirms the disable transaction succeeds after the failed probe,
not an independent readback of firmware state. Both Qualcomm test modules
were unloaded before the read-only monitor test. Suspend/resume and full
thermal behavior remain untested, so I am not adding a blanket Tested-by.

[1] https://lkml.iu.edu/hypermail/linux/kernel/2607.3/10628.html

Thanks,
Birk

