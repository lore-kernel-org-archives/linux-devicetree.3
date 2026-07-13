Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D695385519
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935819; cv=none; b=b1DrNE48i3gomxYptQ7w6Z4nY7b/IBZK4Bz/WkT7h4EZUnmP/nhdvCAJoQKmV2l/7fbHtxsCwVM7LWF/oWmMhZfKWQU6s6nprWYGSjb84QrgLo0xii69hDkXgkgg63Zjjlanv4CJ14Yw6mnAmv7HLk+jn2TS3KVh4P0VoaViyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935819; c=relaxed/simple;
	bh=1d1gIgKd/rxGakwIfoQkZDJqlQDsvXgB5BX3doT1Uzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLS+7UEKrpMzr93oyG2EZPe1S4pgI9yfaiqG9any6AyTxAoGIppKS7YL+P9/lZXJw00roOT/SoyNPFQnIm8PIBhXjB7X8ORxheA2MdRjW8QoUopGMQhkTGVa54DZpaD6mppRd2AJOjmkJSgrJFMR6aVaF4OoHFgio0SdQUEz7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8Vpn6+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRaJNsRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8Vpn6+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRaJNsRw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O3Qs732794
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E09LB8FttLtJXfseyW8i4L083+99GbXlC7bLX0eDPNY=; b=Y8Vpn6+XDg1v3UVs
	ifJVSOVnJCK9iNSdhYFo/MtAVTPoxOgcZc8sfLmOylqkBIRGMnO2w46/2H81dmQq
	UI5wdNAZCI5EVeNea6H1A2HBb+e3nUomuojBiODBpWEvoBqrG12i8U96KeN5d3PD
	xe/9fKq9TIgoG8hxGNzf1lDDC6x9OtoDdnLC9pNDAxpvVECVmS0I6p1wpS/8nROZ
	5Wy40eKFg/ULSV8scDUj9VDslMpsukGcgTDHK3jbd81GDMnAJPi5ZRUS6Lez4RRf
	s1R8wuSuVhm7V+wYIobJ/mpCy2QsgIKS700mKTfWLqAuDOlZbiaYJaU7nDzx3oha
	PJdreg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39wkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:43:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38de4c60f0eso328924a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783935817; x=1784540617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E09LB8FttLtJXfseyW8i4L083+99GbXlC7bLX0eDPNY=;
        b=ZRaJNsRwW/zguBharFpaG5zTDNpxrabdFaafPy3fGn/I4V3XQgemDSjSiAF6Ofq/rl
         aSOAitvcPzXeyUMJHGACQXgHoqa52+a73tMQxvQmQ95pk4l4LBWeO1mHsCgZ6rRTLzio
         FPqOC2raoJEulmm+GuvwQpBtFfBr5Bj3YC7TsrrudcK2cvioOVZXlLWLd8/byKZ3dD52
         sSj9L0h2kxokLnECV5Z+t/lPT4NosZ2zOv+Xq/IFo1Ju/KI/4pntt45s7/OAe+EaNJX5
         5VUAq5WdzndpegCstXYXMzR2JOsnkAUTA39zUJsA1HXf+d/MjKMllh7FUmhCheLDLzfr
         VgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783935817; x=1784540617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E09LB8FttLtJXfseyW8i4L083+99GbXlC7bLX0eDPNY=;
        b=DYlZqfJsO6EC8jZMLUfM3p60fEmfpSdYsAcbiWUWvZAam2Wl2AJKP6X54vtSRlqrlm
         8GhbO1vmDLIrcjLb96OnU+2F/edM9rK0s0RxU4i4mdcCS4eYwAGF4WjJUI8558OAX/+D
         SONsprZY2KDFSgH/fJfNPmXaWJZi9IWTdIkiRE+bjHfy8yb8jHhwH+oOPSJSHz2hWQvB
         zXsrMocLz6FRVXWDniKG/91FWSisyP0rM3h0nrjulfM0tp0h2KidR8ay+7dEnjqEWasG
         J0kk2aYx8IKh9T2uyF+eq5FlDKhtZ9fhMy8EYLElG5PKF00pdlULnTI0cqEM4BxCghIC
         u34A==
X-Forwarded-Encrypted: i=1; AHgh+Rq5dvahqgY5nBi+DsBPDvHeXGA7v4Si101m8yl607ofBK+Y0J5nYqV2PPRdVT1pB/hnq7MOuMdIY8sq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1jNmmPDcYbNa+kJS14As0XiJG5fMY6xdH4GYq6Nx3tBJN8orX
	3K14OawuRxgg18mht9ikI7AYZFRn51d/oszCHYvg+KlIR8DyFVS8Zb4Y4O4j/48/nbXzx3s0Q0V
	SNrdBtwQroWzpII6scJZt8HKDXKntGosHPoQf7d43NPqSFGHXH4qizt8Zz0xRmfzS
X-Gm-Gg: AfdE7cn/1fc+qoAsdWMsh40nAS19Fmd6uAkTnmTLMRXU9NgPe/LmLsTW6Bua2d4K8bT
	/XGYxTBaXM4JZL62wFfZbF1gRIkM0hqw5QnopOGcEsQWU5eN+5qqFuSDkL2KCMiaArKTjxpEpfy
	my6NWOK65NEAB9UVIL600jidOIEzMItCK8EBXL4yg3wOLjI81Axtk3ekG3efUMqzvbYtIIpjsSM
	e/iiW7i132N3yePYPhw/qxBp2I976BDSjphOSvXhmksc4+t35lz/3JJDrj4gGjeGduORmXYUidU
	DKFTgwfVd8jzQwpB2JdVMpsSOb4EMtp81ruba1Dg5LKUJivrF6kXBp3iy5aFrlfxC6uE+6sH9eY
	AKjqlbNV13M8Av9xPdlaAvfZS0PANLK1m2cVA5vQjcFcXl2UOacYxoAComcdvUA==
X-Received: by 2002:a17:90b:2b4b:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38dc7b7063dmr6317613a91.6.1783935816653;
        Mon, 13 Jul 2026 02:43:36 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4b:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38dc7b7063dmr6317583a91.6.1783935816051;
        Mon, 13 Jul 2026 02:43:36 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm37848388eec.16.2026.07.13.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:43:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mengshi.wu@oss.qualcomm.com, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Mon, 13 Jul 2026 15:13:29 +0530
Message-Id: <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709095726.704448-13-wenst@chromium.org>
References: <20260709095726.704448-13-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwMSBTYWx0ZWRfX0mLKR022OqOU
 5MZWBN5CnVA2y+/vjFdhakRInY6YBD+tvZEWQ2DK+aDI9oXHZMlRprqXh2Nk3qTRC8JHxYTP8UB
 A1p1Nbagg/lCjBpK+yBbV1+yasc/XGAKclVC/JQQ1tSjR1Ga5JtSixtkTnTWnrhBz82Tbc711jI
 5a/1d0uVtP029VWKZ53TNLXZNcXxNlYNbnci3Yvu4WLtqCSFH00skpwikUrMw6S+9XuJ7vdPrbd
 DYeS/odupPoXznvElFWI7Yh2YfouUYcgRLbE1w4LWtwo3CTIv50Ox/TlUFbPvsf1TfG/2yt1HBQ
 0yGUzLLHxuBw2qMsoSOLL8e1baUuHsyrvLK2XQDaTqjvvU/AijbnDcXYSH797Befjoyyf32XJTV
 /q85kPlfCIaEeA0XLabcKq+r323hiD8YlmhTbZqGG1yqjJ6n4FPaPRq+BbadPY+ggxOh1X1sgaZ
 hLqg2m11FoYsECQfucA==
X-Proofpoint-ORIG-GUID: sLp4UMZ8QbSvLll0z2Z4fBvekm7gZhkj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwMSBTYWx0ZWRfXzuahSVtCMs1b
 z3Z9yU4giBUSdN4v/ogavIJHeoIw2EJpj5umHg82A5wHzbwbohbChn+HnQkl9UTfABzvesDh9DJ
 T272RoNVdH3W8O1AiJyFHqIQTM8damE=
X-Proofpoint-GUID: sLp4UMZ8QbSvLll0z2Z4fBvekm7gZhkj
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54b349 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=AJ_gLjkuB4Bcd2vTZOEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130101

On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> UART for BT. Currently the driver only supports PCIe and UART.
> 
> Add power sequencing targets for SDIO and USB. To avoid adding a
> complicated dependency tree, rename the existing power sequencing units
> "pcie" and "uart" to "wifi" and "bt". The existing target names are left
> untouched. The new "sdio" and "usb" targets just point to the renamed
> "wifi" and "bt" units.
> 
> The "unit" names are internal to the power sequencing framework, and
> should be confined to a single provider. The names are only
> informational. Dependencies are tracked with pointers to other units.
> 
> The "target" names are the strings that the consumer uses to acquire a
> descriptor with. As these remain the same, existing users will continue
> to work.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Expand commit message
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 

Hi Chen-Yu,

We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
and UART BT M.2 cards and found an issue with UART BT power cycling
when the USB hub is active.

The "uart" and "usb" targets in this patch share the same bt_unit_data.
The USB hub acquires the "usb" target in hub_activate() and never releases
it, so the bt_unit enable_count never reaches zero when hci_qca calls
pwrseq_power_off("uart"). As a result bt_disable() is never called,
W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.

Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):

  With your patches:
    lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
    btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callback)
    btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed

  Without your patches:
    lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
    btmgmt power off -> GPIO116 goes LOW  ✓
    btmgmt power on  -> hci0 UP RUNNING  ✓

USB BT card (WCN6855, sub 0x3374) tested separately works correctly with
your patches.

The testing was done with the following Hamoa-specific patches on top of
this series:
  [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
    https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com/
  [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID
    https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5e725091266a@oss.qualcomm.com/

The fix we verified is to give "usb" its own independent unit so its
enable_count is tracked separately from "uart":

  static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_data = {
  	.name = "usb-bt-enable",
  	.deps = pwrseq_pcie_m2_unit_deps,
  	.enable = pwrseq_pci_m2_e_bt_enable,
  	.disable = pwrseq_pci_m2_e_bt_disable,
  };

  /* change usb target to point to the independent unit */
  static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
  	.name = "usb",
  	.unit = &pwrseq_pcie_m2_e_usb_bt_unit_data,
  };

With this change, uart_bt_unit reaches ref=0 on UART BT power_off and
bt_disable() is called correctly. Since a M.2 slot can only carry one
card variant at a time, the two units do not interfere in practice.

Would this be an acceptable fix, or do you have a better approach in mind?

-- 
Best Regards,
Wei Deng
