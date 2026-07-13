Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1833749F6
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934187; cv=none; b=aGsSE81Qro5YWdZ9B3CS9Hz5lZLgJ46/D/dZ8ORJDTSM8ChtD7KwN/FjhSx0ah8jFYj8zn6b3KMkB9gZ9ec7opedXHTToZERO5DxNkP+PFcee6FfYMg/4q0siZ8ldb9URctMZZcCj8XgTcat9JtvAWbRzipTcSNb8C409Hn09UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934187; c=relaxed/simple;
	bh=+IKt7HkKvvuZndazkU87cKD2wlXL3ZMBBm/eMI38q4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LlGC6BiGkbHve04eRXpbPZlgF4X+j76cHZsYqEPBvETv+80szOsvhaqjFnr3cMX43G7E6GQZ/eBoLAbnhC89NnE1d9UHG7/rW3LH+5pfDzctNPpm830U1bTdmMGDed1gVjewnLDsYdjwrhobEdRDih6++J+sLzTno3cR8GWx80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afDUukYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Thh7j4M7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afDUukYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Thh7j4M7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77RQY810576
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u7OzcwJPgZs
	QHVGY+2aqMLjEMoYse2TWQIvIkQHyER0=; b=afDUukYQ78MH83XCkauFs+vMTZ/
	xOyNWDf6WL/CM9LJdHEGic30lGUYZvRGJJ3Kyz2T1y0HCT22luB0e23N+z/EUIzf
	5khm/3SMHkGQsQh6bHyhITolyRnyFm7C5wpjQj1WtRuYZyHwr9+wC+alJ611tsG0
	8AtNzdrndDhk8XAcPDSte+5v6N95Rkf6HreGQNdT/W5+VQb5VQU06CIz2Z8+c6WY
	vPVgd01tsrDfzhhr3ZCXUeybPw+3CepMYtgJyNezCPSuObTlbCwOYjCepvjcsx1L
	QJxpnVywme8ybMu9ADH9VwNZet/eFzd4szu7a1EkvXJUMTHpC9cs2HiJPFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrfph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:16:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3883dc4ad23so1216094a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934184; x=1784538984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7OzcwJPgZsQHVGY+2aqMLjEMoYse2TWQIvIkQHyER0=;
        b=Thh7j4M78vejxkyH8T5Yml/dsm5WAUCL+cFT6Nui8nr1IKKJUjtNvyhbed3rGOj2z0
         ZijxFVne8/2ygOjcXnA/jqwhYKdA1x59oUr9pp1liSHj9xX79YZsqa/hX7ksXbyhKLPB
         zLNZgiegfuZU8YWZBDggsbxX2zQ2+fqZueeOswy0TLU7cyRu1DumbkQ7UQ+N4oObPQmO
         J57oGCugElKA4CD5yx1MnOo3I6nF/VuI7tKOfLFo15FGW0qsIA7/W7OUZn47erVJNcAJ
         1ej6tdYokRG7WdRHZDKhCNG2OZP5xyyR63VT/VojiP3zAjF3tL5nVDvvAnk1b8K+CF5B
         ixEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934184; x=1784538984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7OzcwJPgZsQHVGY+2aqMLjEMoYse2TWQIvIkQHyER0=;
        b=kBPtaBdblHW02DNV3lbge/LMRof2jFYNwpD23laKqFMRdC1IG9JWEAWVPvqjeB0YaU
         56RFTp4mnfrdc8GrUrBGGpZDbivR8ClirrDl/n6yNhE02d12LnJQM/O7d37lDgsIhn7I
         ptRR7leck9ltuz2dH/FahI5SJ5gpatocNMWL1Xse7hZ0aqvQKqkHiHx35tD2WvaBEbML
         NhrCWr1cfvsfBJNA3Hnm+hFw47xnwSpN1+2dCn/YLBxmhyDNTc1tYiM3OoMDg5onM7rB
         f82mWJ2KHg4zOPcaqhhrH67Sg58cOE24euHUmilBQkWm5ocN9IXM12zPR9AeF8znOGud
         3mrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaWaI/x/4vyW/lffufYwgrA+P/Ys6NhlVCVuVp9ZeUk4YCzsYk8BT/TdLRkhS67Z6s1M8LiXlKRKj5@vger.kernel.org
X-Gm-Message-State: AOJu0YzfqzDF1lUtd9BfTQCuHFLnDNvztWJUq2keR4ixdIYfDSVps6ze
	/uTYfyTFerkIBqYhd1sBqQ1WSk92CL08a03PVzxCPFxuwFDw2aS/Vwp3OjL94dHkocxttea15/6
	H/SAfvcEdE/FnzLaOTIX9ALZDY6YrR0cVFOzybVZdZ01RUxijXWHwPsYakluWPiGE
X-Gm-Gg: AfdE7clZYNtzrNLtMoJ6syfAqQaMxOz7kZLB9L7km21ZuiyLgN8g+IfTG9A4io6RlIS
	L3MUjUw/jg/aKvIwd3dgOFAuxP9ayqYEuFUT8Js2On1Eweg+JLPBGItVAFS/GdQzU5g0PphowzG
	QhQ1ZHXLmRIFgUWkDbrCRtIv1VZCHmhsBcij0KmyB3/Yar5fBhvYzLtTyT5t5xsBmMgsaTEF9cW
	H0IdD/2ip2EkQ4gR1bkGIKui4/D/SA0nnBQwnn9KzGomsMVhAgjNRL0rQqxLJzCOTl5F78qqE/b
	Cg2t6GRfVg33dC5B/UuRB6eo29cl48XcICIMFQBw3Gl2fDTbQq+KvB08y9ksSr96j/JNcd+cKzI
	d4dMsmLlhdLVx8TV6kv7KjJ8B6epFaR2NEuW23KJI3UewsxzoorhhXTSl89EV6w==
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr6154257a91.5.1783934184105;
        Mon, 13 Jul 2026 02:16:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr6154211a91.5.1783934183550;
        Mon, 13 Jul 2026 02:16:23 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm26496089eec.23.2026.07.13.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:16:23 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>, mengshi.wu@oss.qualcomm.com,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2# when no UART serdev is created
Date: Mon, 13 Jul 2026 14:46:16 +0530
Message-Id: <20260713091616.4092086-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <gatls7n4xes7mrnhgxwsjof7owpocdmjrvuxazedznwa3zeb22@q3mtufc5dzkv>
References: <gatls7n4xes7mrnhgxwsjof7owpocdmjrvuxazedznwa3zeb22@q3mtufc5dzkv>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54ace9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=M_wy9YA4QbPrr36y3cgA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: W6yF6DbJZBvCWsArl9VpZbnmlFpzZkFt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NiBTYWx0ZWRfX6xl1qW0hI0OU
 ov5TUzDAZA9QVTBxsPd6na695b4qOZb6mrj043aDg4EmoMDM8k+HLRETbuKIeZgYlRguNh4aOLC
 otlFExdDMQabSHW9GkJ2Bc7ZAL9PNU8=
X-Proofpoint-GUID: W6yF6DbJZBvCWsArl9VpZbnmlFpzZkFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NiBTYWx0ZWRfX+NLWpnGBbaRd
 xIQYJ41FTT0CekfNcefu+ZdcVMNJA5KqByI0yYvsbwGSurIHmOdgRMZTDbAoHY5udEHrQQ3PWhh
 fLgbyZ8nB2BDkg+rTOvEFWpk+6Ib/EOn/JNItrqSlnAsP5XvsBtRPrUNTsIAHbXMsvhqcarBILa
 NJ//inhBbPzbr1TVfnoh1TyQ+qfHuVK/goqlu7F/FCGWVVCQGhayMgKzXw0v8T1Jl6QrR9mD/Si
 tCUk8zRuAJfHb1tLyvU0qICS3ajVjA0t0coGtDqHdnsn3z1texwIDexiYjVQlccWH+UcBb+IYOh
 B5jYXYQRhiprWSvoajGXNhb4z3ZX1Jrh4ULx3bAeaFZV3QxQGpSNawzpjcgaf+1TP4bgup8VXL6
 B/vHQMk6TQa7DVvm8xrCVsGqQadHTgZGfsNvtpcJ/nhtBr9ewc8eJRuGZQRdHoT+sj6JcHg3II4
 rfMx6nXeXSWEBu9TzXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130096

On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 12:59:42PM +0530, Wei Deng wrote:
> > The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
> > BT transport and need a UART serdev created by the driver. When a PCIe
> > device under the M.2 connector does not match any entry in this table,
> > no UART serdev is created.
> > 
> > However, the BT subsystem of such a device may still require W_DISABLE2#
> > to be deasserted to power up. Rather than adding every possible non-UART
> > BT device ID to the table, add an else branch that deasserts W_DISABLE2#
> > whenever a PCIe device is detected under the connector but does not match
> > a UART BT entry. This allows any BT interface on the card (USB or other)
> > to enumerate without requiring explicit knowledge of its device ID.
> > 
> > The primary use case is USB BT variants of combo chips that share the
> > same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
> > sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
> > W_DISABLE2# must be deasserted so the USB BT device can enumerate.
> 
> Instead of forcibly toggling it, would it be more sensible to tie pwrseq
> into the USB too? The onboard-usb-dev implements the same idea (of
> powering up the USB device), but it predates pwrseq.
> 
> > Reassert W_DISABLE2# symmetrically when the PCIe device is removed.
> > 
> > Validated on Hamoa EVK (IQ-X7181-EVK) with WCN7851 NCM865 USB card
> > (sub 0x3378): without this change GPIO116 (W_DISABLE2#) stays low and
> > no BT interface appears; with this change GPIO116 is driven high and the
> > USB BT device enumerates and comes up via btusb.
> > 
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> >  drivers/power/sequencing/pwrseq-pcie-m2.c | 33 +++++++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 10 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
> 

Hi Dmitry,

There is a patch series from Chen-Yu Tsai that appears to implement what
you suggested:

  [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
  https://lore.kernel.org/all/20260709095726.704448-1-wenst@chromium.org/

We have been testing this on the Qualcomm Hamoa IoT EVK with both UART BT
and USB BT M.2 cards.  Is this the direction you had in mind?

Thanks,
Wei Deng

-- 
Best Regards,
Wei Deng
