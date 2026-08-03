Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC293DCD86
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748985; cv=none; b=XG82bwOnuRp1BdCEIhtBkmV3012wCtvkzwV0r5UGOhiwJDvOAJUYYOTGweNT2XnzDNdzc8eir6UR3xnkoYcuXf5RKzCx6rcKeJDJbBH1DQT3KdxWerqlPwL3gLTocXf3XVImchelLzfgAHex7kF1r7RaS+Mm/Rmdd0B7z1HLkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748985; c=relaxed/simple;
	bh=X9+2nJe4ug/gASVKfosspTsFtedg/NhqFpFbQqpYSoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCJtlze/zxlZe75Bioi30FGk+ezOKa2MjmchvTRKD9lxTO/URj+D1j/4Ix3Aka3+Ymd8J7jcLb+dn996/95m/eWaup3tByeLFacESuMIVhfqfnLU2Rf66u0+isYUSGq8Nm/gFKYwXQ8+NDxc2ZmuVS2ETR4Aa4fxeLFmgOSMie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIB9ZVgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0I96Iy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIB9ZVgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0I96Iy/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736T6mP4014972
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1xNhHRmjBylVBe+cBFr9X9Dw
	KitUCaw4odoWX3q9r24=; b=KIB9ZVgRp/HQeDoz/1B9+P/rHvjqgoJcie7rwDvY
	K+RX+SoM5fuaWyAGMUN5MOg1EbyKis91D/4QnaDFkmXoGZkJJk1mkttWfPxdlyzN
	YeAtOB7IATpgBFmzcyJTSGtpCtH1csoQ8meog3+Jjy+65mdLtAw7znNOyVQhsGq1
	bso+Z9rBnR7Rv2krZsl8Ubx9i/QBPSjEBZ9s5O/+iLixLvyUAHkSnTRSaNZpTV9y
	mr9uKHuOAgGPCQN/2WPNhCcvv21AEy+jmlvApaoo2mKG9UDFauyx0OSCdcvGlfYS
	5yOogT5mPrHckBbTCQRlxEBrzaGgVV3N6KiW6RqzZqUzzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8s0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:23:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5027441a12.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748980; x=1786353780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1xNhHRmjBylVBe+cBFr9X9DwKitUCaw4odoWX3q9r24=;
        b=O0I96Iy/kiJEhFIb1wmsC5PAm4JG0P0X8pVajMnLdEDavLxrUu3fhu1QuCn8HHUMJi
         mbaKJzTDs1XajAs3gJjkgr25kZsEkCIsRQBwpxA3Kz60uH6E3YsfIjaWpQ3+cbvAfM0h
         yGZfVtYGyelzC8RDOQ8CaWuFrYdPo4sNDgNR+bdqUlYFNCW550ouyATRwEuXylaXTY5H
         ox1dyAf9ttXQSgY7024++4Z7Y3HmBAHnTZEheSPO8yDWz+58bMcKrv/BQjTbwRMlGN66
         stbfDvVyQAten75/B0/yBwvKKa3pr/oA0WS1QOCEgHIDmaqQZ6hkfg8oLb0cOLrPlMPG
         Os3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748980; x=1786353780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xNhHRmjBylVBe+cBFr9X9DwKitUCaw4odoWX3q9r24=;
        b=DAMDf5Hret4AbFdRxYewyDtSqOt+8OYbMHkSXnD30lXUjoKRSqwRfSyl51WUBaXioT
         4j+1BtBpfF1enZflDhIoPfTNYkIAshfTBOOlO0/8WHzpZCxe20cpKl1i1bq7Th4pFECu
         xncE4yvmeSDQ8K5K0RL+cERl5flHBNmGv7sLuB6zuxtKlR/1YlEjI/Gy20kFoRYcprOY
         YxS0qzTzIOpsWUIXkOrkFhXqefw6Ouf3MzblDs93M4cMYd+lfOGpIi1EOGW+oUmDmGl2
         ptm/59kaAXO+J/MZvdO6QK3xw9Dpf6qndNVcfVZ3YTQoO/GbjigtkJ4gJy4Ax2bA7/RR
         38nw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6QTlxVFEAy/xuxNTNtGY1Yo+H8rDmIyavzgQX0hfMWhIJq+ykXqPmnoVgJyYPMhSD0iSuWG+31MlY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3avbgNkNnJtFblIH+5xT38FDIlutIaXwrnSnkuyKlmMhBCHMj
	ZByN31rrvbvqPeunYdPlr329kxXM92hNtD3bbrK+ulo5oD3ZIrxmzpzcV/8kenO1vq5BnjEAufr
	bAvkjt6GOzjgLQS89Lb5elyiFhPunq002ErqvqndisFkh8qO8EuYCoUcubULarfcL
X-Gm-Gg: AR+sD11riz1sejNyAjXTy/2j6jZ9jfFd2rQ65uQC30df54+JCOat6yc6JpiEjQGLl29
	797R168Jvk38OX0TLqQQ1zF5EgLaT2Pzd8nakV+s+Rt8qQI5eQLc9jrpw95LKYY99jVSCWND9Qa
	wKiIFKrTIN5vT0fNgRNNWawy8NmuSBcX8j3iSBr3suq4PLVd1sR1s/L8blpw6nOYX68QOSrnpf9
	g21Hrld5Cq8fBogIocNA/eoeITyvOxGzmAmpJvM/EepGRO6xbF1bdqIGab0CiGs2Yk4BiWuRg3X
	P5SKRi9Bs3q3HRHjv0kdSC0sIoDyXuGwJONUQrbWNtP/cp7+JrM1UWyMMvQkmHLnY1vrwJlHKaG
	+DNcfXBDaWO6KWH0zKmysFk2yQdE=
X-Received: by 2002:a05:6a21:648c:b0:3c0:9c19:658d with SMTP id adf61e73a8af0-3c92a89b8d5mr10122655637.71.1785748980314;
        Mon, 03 Aug 2026 02:23:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:648c:b0:3c0:9c19:658d with SMTP id adf61e73a8af0-3c92a89b8d5mr10122611637.71.1785748979783;
        Mon, 03 Aug 2026 02:22:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm36259828eec.21.2026.08.03.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:22:59 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:52:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org,
        gregkh@linuxfoundation.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Message-ID: <20260803092250.ucoh5qnnnyurgyzu@hu-mojha-hyd.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
 <chf57j2dkhhjzigpguldadfld5utepa4sxwbo7fjxk5nq37bhp@yci5agzh46ly>
 <al4EG1FMrI0z1D7z@vaman>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4EG1FMrI0z1D7z@vaman>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MyBTYWx0ZWRfXw7mVF5+MM8Kz
 zI5UQGQyIe8KzUTqVRzvAXGrCLEh58yfIe2twr13vussV+0cYZIpHS78yLR9ITmx4imlefPCP7h
 mH8QET0k8Z++dbByogENrnuzli62QUmZI5MitwQUlH7UcVmnaGEHL1/xsoHcjNzEJ/n/6UCo+GT
 vgsRWhPSyTyqg96fuv3QLmz82QO7YL4YFrjaro6L83XLMfnpLSo/VfXWJ09G4NkIdPG+IfR/krg
 rUFRR6f4v1Tq/tkAv7YJKztD+5qTiAEDQXZGq/Js3441JVcJY+MNmmh8dTNiynssr6BnlbcLUJJ
 L56VfX981lftqPHKOt8+DvoGKwv00476jMls7ZZmnYYSKQOzNTX827tPoF3QQDpe/ShbE5NFZZt
 +7yN5arJq5bd3r66g7fecUPcq2TGXIQnLB0fSnFrcFU+kFLucRmpj8/BnDWjT/TB10qljMMm593
 vqGOVPf5mcEmFHA7juw==
X-Proofpoint-GUID: tMO4c76iPjJfoVwt8f2lWJXRb_X3qTCI
X-Proofpoint-ORIG-GUID: tMO4c76iPjJfoVwt8f2lWJXRb_X3qTCI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MyBTYWx0ZWRfX4znilyTvjpwE
 FUtpo+PuNwskvOMCalYSG2fH73vq2/fkqon/a1lkRKWkr45J7IyNgTlKXvjAn6khOxtt9iN4vgy
 7xHkLarh975WQkwCNXiGjTaNxDsAYyU=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a705df5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BafedZZDLhzKb9y3GCEA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030083

On Mon, Jul 20, 2026 at 04:48:51PM +0530, Vinod Koul wrote:
> On 13-07-26, 13:12, Manivannan Sadhasivam wrote:
> > On Fri, May 08, 2026 at 02:32:30PM -0700, Ronak Raheja wrote:
> > > This series adds USB PHY support for the Hawi SoC. It documents the
> > > QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> > > compatible to the DWC3 USB binding, and adds the PHY initialization
> > > sequences to the qmp-combo driver.
> > > 
> > 
> > Vinod, does this series look good to you?
> 
> It doesnt apply for me, can you folks rebase and resend

Sorry for the late response, sent the v4 here [1] rebased on next-20260731

[1]
https://lore.kernel.org/lkml/20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com/

-- 
-Mukesh Ojha
