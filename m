Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4511C3A1D02
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483199; cv=none; b=t41hcrY+FUrAhMIC/O+dmQLcvkNloXsCQ0gf4uhz0rHuWt/Dlmc4Nhl3WZ16I6PB9aVK6AOz5mqiOFpRxLB+bidtA8IQP2+91RgSUcqN/D+D7Nn9rd2LaLWmfTjVBhYfW7DKtvJofOEQpEuJM3nw6yYpghu0qk29qut8UdKiVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483199; c=relaxed/simple;
	bh=YqmyT/qYu2cAbEn9E2TIrN4Qg2QW80P2POHFMYOKMz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZZAy+pthtAHUZkDgybHA9KAZkNj52qTiSD+6Qi3+uLDedKFMUXpv0bWaLu6n7WWXtWmtEUMFpws9LI+KZQXROi2mDXDRr8184rarubD+CLflb2wgeNxJl8E1VYkJKEcKwQTQBgF+8DPUVaqjTdpmUKCreYiHH89LvhIm2VgRdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imaswwqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2SkQtug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imaswwqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2SkQtug"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7MVYA3605130
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpdokqVBnZKXEDjkp04OU7LpdQXx434D5TMJ95t5YV8=; b=Imaswwqq8gmPTlZy
	t2dsZeH2OtJEn6rlV+uTaqGyuwvnpTkxgur6b/DFPs/2RHSXrnqVU+n4Lyv/XixS
	EgYbaahSV4R7XWLniAyXX8ywNS6JXNaJJoWPoQEkTH50xdIyAJBcCnIjnMB8MEJO
	LAL3MmQ6SRMG4QGZU0fjT+iOcMd3HH5dVx57aDEFNNDYwfhxCRdAwUWSY72rOyLK
	OaPAHzqLKf9VYwvLTRW4b38XHLcDkCU5aR6JmiZQX5TkTredskpOLRv8U/uY2pHo
	oyaU1+q1cPRuVmJFSBHelu0gQZyNf+6b+grUhPEQb1h7a3sXiBwGZOvln6fl1NEA
	uezBjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frq8vr1db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce756aa72eso2235435ad.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785483195; x=1786087995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpdokqVBnZKXEDjkp04OU7LpdQXx434D5TMJ95t5YV8=;
        b=V2SkQtugNtswbFHC4RjPP/Tm+fqBrS7X1jHvonr78I1GNRhA34X6dj0vxYieaEyvnQ
         ADWLmD+mEpWivv/kX54Xj1zj+tDsEurePeVgrkiZJ03PHiZfIs+sCEmzcOiblnlv4gXa
         YF8xibCjD/QFbUeun3bYOITmLcLTwoTKwqev1jmA6C1bw82jSWIz9ycsF/C1PgduQEKf
         Kf+M6p2ZK47Q4uaczuMZJEX3RIhwXXLy2ZkizPD+n/8ZKyuEH5s7CZhKd6VwBPQAx20i
         NObALY+aDSluWYtgbOLSuSHKlFKE7uWyLm1tlQjvMU4gv01WZcj88d37FJPloqzaj52r
         /fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483195; x=1786087995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpdokqVBnZKXEDjkp04OU7LpdQXx434D5TMJ95t5YV8=;
        b=DXdblEdsMGzfT37Vr3YineDTVLOMT7Y4Sj3C4TBubvyIRbTlcCsZle/2SA8thfU/+1
         esNxURjMvSEmUdQ/KOwTem8dZ7NY4bXM6v4syIAodpX6+U3anRmPDeTGFYfPb8PNMKiU
         vs2sICSRv2pwCL/wtR18Zw033rqO4+uGpm8FXv5EK7uBcPbp3vRP3JWF8UF3p7KSdFeP
         7ed5BvWf4mBPTLCP5GzVjHA4Cv18k0f2wpn2O7zS05hXZxJcYBrde3lJix7GXb2MbW/n
         JqXUKahw+ILMUzfy8vY7xnXe6thQzsoZbKMoIri5dBuDDPWyfAfkR4O8VX08sgXxouMN
         6j4w==
X-Forwarded-Encrypted: i=1; AHgh+RrsS9Uynac2s0FxUCA1KLsMhGiIAJYSuoyLgUx+/nhxw5N+gYou8iBS4pR5vqdGhu0O6WcxrSlzhsnq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lVPCYMz0dXWAqdAF8ksQ/sG//U39PcAsFkBhcEPHEtX2VZGE
	/meD1lyJwqeldWusd5cMqtwMHKAHaosNfPnHanTZCqrxTxWuOWGQhq5d5YILmG9GgBGiKfynpmi
	7r/Ot3O/eaeNIlcrXp5oOLIH3+wg6Ll8k3s7EPa/bHKP7DHfIhcXfmwM/DJfbA5oa
X-Gm-Gg: AR+sD11SBecImAmVjvLQA/jPefMnZgLuy3rfwMSItdSuzThCCmFgpmE9Yt7uJL1vr7t
	q8CaGOzXbJJcV+6Mp+2eUdwJCKfMRjbUCeOj9f5u6ICKZo1EB2vRzFQZDBWXOFnEIRXhUQ4uvIo
	OPMuV6ZlBo3n44U6voaT19Flkld/Iu5RV7JMuVO3jIyXUA21mf+z1deILFZRGMcSCP1USiRMjjI
	n7ATUZx1L1LMg7OmvaN6XyJJvQbMj4srFGSAftb/xkifiRbdEllC986IC2wg7UksVnPbb4QgVyo
	fP7LneTNz8ljsPHTtl52t3IBpVhzmq2ao4Lo+oBFEyFUHNYtYBIIZYOPI7dsNf8lFoXQq8H9tUU
	xvi70xaHb4QAnJ6KyM7CdjF5KBDJeHpLjocqgKGrdHIpQcr3diCo=
X-Received: by 2002:a17:902:ce06:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d046fa078amr17274505ad.4.1785483194657;
        Fri, 31 Jul 2026 00:33:14 -0700 (PDT)
X-Received: by 2002:a17:902:ce06:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d046fa078amr17274125ad.4.1785483194200;
        Fri, 31 Jul 2026 00:33:14 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e70esm4933384eec.29.2026.07.31.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:33:13 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port and add M.2 endpoint stubs
Date: Fri, 31 Jul 2026 13:03:06 +0530
Message-Id: <20260731073306.1895428-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8dd0680a-901a-465e-898d-88a17a9a71a4@kernel.org>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com> <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com> <8dd0680a-901a-465e-898d-88a17a9a71a4@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1MiBTYWx0ZWRfX3Gj/QOxr2V9R
 t7HJfxlnDduFN7I1IFsBvedfydSmGFDql4pjjaV+RNq9sihpK67EmF0WjC9TmbLKhGkyWeTIr7i
 K7DCniOwUoZCMyZJD/aOjHy6S4PixuNe/d58Ub6C7cnJtK6km0ewzHNTsPDi7IXBH2noMncagt9
 fEBd+RJpuhFrc2+yKnkoq48FryOGtgo6gej0JY8DhTuDMautXffRq7LnIoqBoPfC5QR+L0o3m4m
 eL0lBePDAJGPkmYrL2CLpjvrWuMFM+K1fJILCAOo9PoqdaSuPnkwh70PKJwHsKwcec+7ttVmMIf
 dZsUCIbKIjSV5SVPRQZBzs0p2/aQI4Jp8GRzyZtUYG67lvHLrWGGpusVs8CkW70s/Vov1Ys/fYf
 FEc+N90tZrNLviJRo5D/LWLLJilNK5Dokr9IgqwWm7L0DAmVfWIMa4v1REuNJnwQd3/NCnVAOEk
 xVanqz9Gh0kVnwuBTWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1MiBTYWx0ZWRfX20S3IzP1d5Hx
 /DLF23xdif3A6tcJCEdZU1osWso68Af2Y+AivFQCjmUj5HdlgqDNbrOlt1kV/5UyrGkH8BmWpmO
 lHFtIXjO6RdlJ7aiTYJXzHgwLz6P4jA=
X-Proofpoint-GUID: WYNR5mRLf37kY2J9U1jnnTktpPKEIZ3E
X-Proofpoint-ORIG-GUID: WYNR5mRLf37kY2J9U1jnnTktpPKEIZ3E
X-Authority-Analysis: v=2.4 cv=eq3vCIpX c=1 sm=1 tr=0 ts=6a6c4fbb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=GMep2Sy8T26hx5v__mYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310052

Hi Konrad,

On Wed, Jul 29, 2026 at 12:46:49PM +0200, Konrad Dybcio wrote:
> On 7/29/26 12:27 PM, Wei Deng wrote:
>> Number the existing High-Speed data bus port of the usb_2 DWC3
>> controller as port@0, consistent with the snps,dwc3 binding convention.
>>
>> Also add an empty port@1 endpoint stub (usb_2_m2_ep) for the USB 2.0
>> interface to M.2 peripherals, and an empty UART endpoint stub
>> (uart14_ep) in the uart14 serial controller, so that board DTS files
>> can reference these labels directly without re-entering the port
>> hierarchy.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
>
> [...]
>
>> -			port {
>> -				usb_2_dwc3_hs: endpoint {
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					usb_2_dwc3_hs: endpoint {
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					usb_2_m2_ep: endpoint {
>> +					};
>
> What? Why?
>
> 1. what's wrong with assigning the existing endpoint to the m2 graph?
> 2. this breaks bindings - port@1 is supposed to represent the superspeed
>    connection
> 3. why would we have two endpoints for the same physical HS connection?
>
> Konrad

Thanks for the review. I tried (1) locally — repointing the existing
usb_2_dwc3_hs endpoint at the M.2 graph and keeping the singular
"port { endpoint { ... } }" structure — and hit a functional failure
I'd like your and Chen-Yu's input on before v4.

Test on Hamoa IoT EVK with the Chen-Yu Tsai V6 pwrseq series applied [1]:

  Option A (v3 as posted: ports { port@0 { usb_2_dwc3_hs }; port@1 {
  usb_2_m2_ep }; }):
      BT USB device enumerates; pwrseq_m2 refcount matches expectation.

  Option (1) (singular port { usb_2_dwc3_hs } with remote-endpoint
  pointing to M.2's port@2):
      BT USB does not enumerate; pwrseq_m2 refcount is 1 less than the
      Option A run.

Root cause, following the V6 series:

  V6 patch 6 (usb: hub: Associate port@ fwnode with USB port device),
  for each USB roothub port, calls

      fwnode_graph_get_port_by_id(fwnode, port1, ...)

  where port1 is the USB port number (starts at 1). usb_2 is HS-only
  (maximum-speed = "high-speed", single usb2-phy), so this is called
  with port1 = 1 and looks up a DT node with reg = <1>.

  V6 patch 12 (pwrseq-pcie-m2: support matching on remote "port"
  node) uses of_graph_get_remote_port(endpoint) to match the USB port
  device's of_node against the M.2 endpoint's remote port.

Under Option (1) the singular "port { }" has no reg, so
port_by_id(1) returns NULL, port_dev->dev.of_node is left NULL, the
pcie-m2 match falls through, pwrseq_get() is never called for the USB
target, port->pwrseq stays NULL, and W_DISABLE2# is never deasserted
from the USB path. That's the missing refcount and the failed
enumeration. Under Option A, port@1's reg = <1> matches port1 = 1,
graph walks all the way to the M.2 slot and pwrseq_get() succeeds.

So on your (2) and (3): I don't disagree that "port@1 = SS" and "one
endpoint per physical HS connection" are what the current
snps,dwc3-common.yaml wants. The v3 shape is what works against the V6
fwnode lookup, not what I think is semantically clean. Choice seems to
be between:

  (a) keep "port@1 = SS" — then USB port 1 on a HS-only DWC3 has
      nowhere to advertise its downstream connector node to the V6
      lookup, and this M.2 wiring is not expressible; or

  (b) renumber snps,dwc3 ports to match USB port numbering (port@1 =
      HS if HS-only or SS if SS-capable, port@2 = HS if SS-capable),
      parallel to Chen-Yu's mediatek,mtk-xhci change in V6 patch 11 [2].

I want to avoid redefining the binding unilaterally, so two questions:

  Konrad: is there a DTS pattern I'm missing that would satisfy the
  current binding and still let fwnode_graph_get_port_by_id(fwnode, 1,
  ...) land on the M.2 connector for USB port 1? If not, would you be
  open to a snps,dwc3-common.yaml renumbering patch along the lines of
  Chen-Yu's mtk-xhci change?

  Chen-Yu: given the parallel with your patch 11, does snps,dwc3 need
  the same treatment on the QCom side, and would you rather see that
  patch go in ahead of your V6 or as a followup?

The 3/3 sort-order comment will be fixed in v4 regardless.

[1] https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/20260721065413.2306137-12-wenst@chromium.org/

Thanks,

-- 
Best Regards,
Wei Deng
