Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411623;
	b=ruk777vmDODxkVwvJSr54gUk4ENC/BoC1lw67W4cv2ov4C7hk3osI/phctww23wct0Wc
	 CKyocnY1yGW+TZQ+BAO4s/vPaq5CV/LhtVkRDTQkPEx+ci/GKkBhuaOHvmTbtF9DYO5N3
	 IYxEG4pJaEu/hEiZiKxlEdnCunjWaKEo3Xf59B1a2izIf1h7HPnTJasgE+SNISc8yvae5
	 BDLM9PGchf+Cb4BOX5Bf4p5nGRqv4Ng4RP7gmC2GKXt13MvqEDYrAHcep7qPNa5bncWfL
	 O6fQ7RUMX8tAHy6vmMUtoHHlf+oorJLA8sbhxEjOAjKJTIh5vklENThzAbnYzhPDRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
	b=jMM4MT2zOH7R+70uTSKXnWpgdficXHITPk3igaqKfdpiA+fEfrp8+6gAtIx7Dq3lMvQC
	 I2CQTZNT5e1s17r5gVIYAPUEJLbw5sAET0O7sWK6+LkSZyLlbauTxc+keV7MUGm42t99T
	 aaKhrl8GCUyZZbVtQAy+JueyaiWWoAt/SJiwpsEAEZ/bvDPDcoqRpxN7PV7BJ6OoAlatU
	 3KDtkeqhScUyr7Boqd1I6uy6q63LEGe2J9rAAsrL9a7F/uiQRttZgpnWJTu2hAfYVzT6w
	 lTIkY+CAlD1i160aJMRKsfiEI5bxjrP1UTy4bqWNfDSbf6Cmg/NooNyZPnaKd49UakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0E60A2602
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA0E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0O7V2665121
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FA1mHnF+XhN
	6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=; b=cmpR6iEgItva8d+V7jBmgK1yi8y
	WvWKre2w6PsPgtBTgaWEfwSO0WB22pAYq2s2wXs3kZvVCkX5vyZPsceblbDezrtC
	Uo1bjE4le6s+Cs6UG2u91KzJlCIpbgksbaaxbI5aXWXljnEuGZK6dEQsNZalwD7x
	rZqqCj6g/0yiNTjNUYGDGBeEnYf9NV6FkQrFjqvgKxQgMbhCK+UoDcbknPyGL6MS
	ZELlk2uFR9s+0h3eXlEdSPpR0yjqQMFKrxyE4n782+dz4jPoPOCCGiLPzCiDWtF8
	S0ztZ9CHejo3GRM7n66kaQoMlStB5k0fSGcUOFal++DF0xbQzuqV4Bs5j3Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjhks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso219489137.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411621; x=1795016421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=MFenZKQgsGUlx4zDEDXADzZBOjSh+qOulwQvtjrmv4ViEkiAO1p+20RCrlv8ybZywb
         3LpiZNkzvZhXmNPtKQ7b7lhlgbeQ/LAXawMF3keNqKYSVqoCNkhpUsxGUrZoZ7hfPnH3
         /I6smMb4IQkDh92FFNt1Ukvm53ocl9RyWDrCeIB77eB2g6wvt/W+BTrYjZPbMCiZXLWa
         xLvV66huARM+yv2Xa+pt+QXR6v8lZCxhvTh4JySqFDz1lc+qyuct9JMcIP4EwyFyGC7R
         MxyEgbdqzqoLyTxr/bfY9KEQMBb1NPXYN47bf0zIvzp5Qq1gtJPDgqTdAwLjgJo6hRbo
         xWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411621; x=1795016421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=ze4Y2+TmEKP/ayf4GjvK9XzlnC/jXAAWUqX2y+MABRzS1Y9HHqAZLdEyfPvta4KmN7
         Uf5O/59WoFzs3FeOcf/fVpiJ8UtTATnWkj90MAVFrpPv1MuRTwQMza/T0e1ECpnZeQRq
         ejPRXDqbMNGqP0uIpD88z+Za4cJYjgViZMfAwJ5etmp242scBUV5CkVKipc5J9NT5YF3
         cHseSBHoEaTyRi6tlknD5VhVyHcO7NGGQaKHUjVBydPiO4DnqfdEpaj8nVPuifgRdjzb
         a+XLcQRlVgvw7rns2v6eBrMLewPXZcPRbp0CSSQxnMkGh7fzHn6+ELbxcT+5bgs+k/q8
         ATUQ==
X-Forwarded-Encrypted: i=1; AL+hErGy9+nm3wuJichgGUhm0chGSxhpKu0H3CsIA31T0U/03DGJUS4b7S8A+H3LWEVen5yTJpdemWucDKp6@vger.kernel.org
X-Gm-Message-State: APuU4Z/JThq38CbpO/qoBKc14qCE1i3h05et8O+eDVNYwthv03HwzMHv
	yAZsKyy0ot0GnX0Aozq83XqD6ePuTZpGl/eSY8vo8ZDY6dAtFuyEqled4lryArpttuqTPXU1LqO
	u5YFgkbtL4tGdU5lqyHVesaaxEr38slBOVEEGjzXoGBRbxHEuX4gFNwWCkf4qn1xZ
X-Gm-Gg: AYBFou0UgiLfKeEYlkamG7jicimI4FecQNPSYBY5xlNIyE0Z1VtF7K1eNeX4O5XWnq3
	8HpxNGZ6tqV/Vef5QnN1MuiO59Gjvh/16Pf8Y0RYXSVFCTSCJE+BHuHbR/ckfDJfhSIUjbMBV85
	25EqajdgkRce7Sr/Ulqk5beu6Ec+CfsY103jsiQfTcQ083kRwG1aJ+aj+FNc1zpGIVJ1c5l2P6q
	YV5R2jpyvVSP5T7LWl4xYo/Oc0HEn1DkVobB1z+1hx4t55mXTy9NyyMFI4bgJOZWCdWDV+x5FJD
	70kDIqCS9nyx9HlNqe8CwyQLaaa5SC0iqXUSgAMnDicP7zTsVNT2jfbqtMf8+KttVh1Y3yCs9yi
	6UX2vAFcCm+AqF7CQJb2DqV8GfM6Gfai4b24cksPrgq+zi6noDLp5m4a8ijiFKvstDSDQz5hJgQ
	==
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763506137.16.1794411621064;
        Wed, 11 Nov 2026 07:40:21 -0800 (PST)
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763500137.16.1794411620618;
        Wed, 11 Nov 2026 07:40:20 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fe41sm5288525e9.5.2026.11.11.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:19 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:18 +0200
Message-Id: <20261111154018.654669-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com> <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af48c66 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=AU935lpaGaaCzQUhO60A:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 4UDKMtPtl2qlVfKzVwbrV4qKGjWDj59p
X-Proofpoint-GUID: 4UDKMtPtl2qlVfKzVwbrV4qKGjWDj59p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX7f00Faoq4SPg
 byIpA7U4ExqsnPeXfnLukmmt/Wn7dKNghpYx5QdjZZDdrMgw7Ds3K/L7BkToRVwKvwpJgmYzhER
 8yTqdgZi/008a2oHnjzk9wRPYPLw1jdX09n1iB1XJ/xxTY6DnSpCxoY8bXkFjR6x0X8ksX/Fron
 CYTJmiL7Y7OqluTepTI1U13oo6SrenbaF9pGEruWV8rg5WVoVVlezbZ9504XZFxYqFR9gk1H4CI
 uwM699lsbTbgZxyCIEouv2k50aIS3lgxAzaLn/AH2eEx4idGjNdbGzzJot8fpUtZ/V/EeC7Ks+W
 s6vjM4NjTM5gYdfYwLnputI94c4urCUfpRJ7lps89lKpFtuQdCH5yMit9nXPQTlYBMhLsljOAzd
 3zEAbvXJaEJGKZE9EZToZSOLfo4iuJNxfT3mnAwOp8XbmOJ1S/OS97MRp6R7jo/pMNbgKXbE3La
 GG4vc9Cc8ABvo/tVIFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3I1IP1L6FlZ+
 sp0SSFixxdJF3xQ8skoz0yfMCQ6o6YrOeuVFVnVlULOZhyFGEsurgl6Z/lNFLyTj1VoMvk1Bu25
 3WiLjb4pRqJmBm/1ofGLPn2tu1dQmlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:14:54PM +0200, Dmitry Baryshkov wrote:
> > +		jpeg_enc: jpeg-encoder@ac53000 {
> > +			compatible = "qcom,sm8250-jpeg-enc";
> > +			status = "disabled";
>
> Drop, there is no point in keeping it disabled. (And the status is
> expected to be the last property anyway).

Ok, I will enable it by default in the next version.

> > +			power-domains = <&camcc TITAN_TOP_GDSC>,
>
> TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
> separately. Instead cast the votes on TITAN and they will propagate to
> the MMCX rail.

Ok, I will drop mmcx and vote through TITAN_TOP_GDSC.

> > +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
>
> Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

Ok, I will use QCOM_ICC_TAG_ALWAYS.

--
Best regards,
Atanas
