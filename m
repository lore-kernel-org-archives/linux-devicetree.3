Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E24D0CF0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405681; cv=none; b=EwKPjWzDMUxJE6fL/XW+sWx11FJbMaIc0E9RAGPh+mh8Yl261s4PAvVgb6rD6pKbE5gcfd5YEM/I2PMTNQZzB101KR1CnsIxYXeSnYDQMS/8GXHPny5irVV2q2TWCJM50MQVJHkWFPjp/k47+dE7JCqC/5rP973fv194o3lFME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405681; c=relaxed/simple;
	bh=aaF8lC2wGq6rXnTUy8jXYHQNfElyfM6ltG8CGXPm01A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzhOoS/vT/P8XScxqJLijl02woBeiVy0yXN/IK2JY00Duo7dnSWNdBp9UfirTTEdsf1Nlxcj2/4sw+/W6npjuqW3ctlUE4ZYZAucgmqwePfdRAnwfgO0EJkSoe7513hD7gtt/1WcI6GE/LAOv422+HWLIUtrsUy8FvHEfk3x0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNXaUZyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYjVJetD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNXaUZyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYjVJetD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Otsi3256627
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SIwhqdRaQyXeNqS0xilr8HrG
	JgTiKRltnjR5Enayges=; b=RNXaUZyc5ZZtRYUoXvwjkCPI7HCbUZ6bW1bN1iVT
	abjIst++tNqDFI001frmR2rmrLFGYXp1KafsuVJsX8VJ8fJ0IALrIby1e4BJgeL/
	Q/Gy8GMPAuXgHvj5FNYgBBrrV610I3LM/zEvY8R54P/jCccSVqdr065bz1jAaMWI
	rqE4//eBk1fUcCV6NUKvJCgnk/HlqWGrrySsOAi1c0N4EJrHZTk2tZE8br69gM3f
	fL8K7Rrz3RwDhB53sSU7XtOH3VBYp6qStzx5yuq+QfDxc6zDTZstZ8NTzgHzsTZi
	N7NplM3FCXUdWnNt6xQHo3xO/e3XHzPy4FLgElpRYweMMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8m8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so690315985a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405677; x=1793010477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIwhqdRaQyXeNqS0xilr8HrGJgTiKRltnjR5Enayges=;
        b=UYjVJetDEM2khiblVUh9zqump759u7cBYaFY1ar9iLc6sKYe0Yd3qLSSIOHO1UkmA/
         e9WOTLNnYLZitO+ySE1giyrm40qZOUAwQKb3fFe0ANlHkJGFgsfUZ0keceHPqzn4zbBx
         EsdnBHf1haSfG/WEDAf+H5asLN8vVwmEI9hpeCEnpFgyz6IUw35eCCYN9NeURDUuP8Zb
         ACjrAeTX9eqAiJIakvkmd4u0urJzrPHo9nlC5oCKj9rL8DKH+u+3/+YiSb2Ib3jpvtx4
         Qad9zdUG1cSlnZ1zBoU5XVGkxMIARy1fEVBzMGE3FQ0t3/JzgzVOd0Nqgj3Otu4Kp4xi
         iSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405677; x=1793010477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIwhqdRaQyXeNqS0xilr8HrGJgTiKRltnjR5Enayges=;
        b=AfnbEo0PkG6YHuPWvZwF27sdte8Y5zb7+DXbqOEpYPljnWHjriNICrtml9FNTHLsyu
         xlLml5/IiJaBVmee6WRPQ7M9zk4NA9zoKcX8UsQmUoeUm/jUB3YbyW6R2XqZUtw48rpR
         u2nYNY6oUnQcELrZBYvUsQpxFbKN/ED2iIyCYU50CqW+BAXe3ysx5B2MUVrfYW99104a
         n3dJ1U2HUsTfUITquphszbwmn1HmjpiQOFNupse78C21IxWhm4QyZKpc/sBjVVcyOMz7
         /0pZK6LKv34hIcXjDji6rn30XxXoPmLmrJtoUBbBuRgzE3IB5muLw5wZmlDX8O7lwGgm
         M62A==
X-Forwarded-Encrypted: i=1; AKwUvBz1XcgHJZG8xXn/ufc6VFI2yUmPXEs5nWs91rSsYLq5ie/c0wQ/zPjsL3udv01K9vb3eLROXX7s3nkY@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ+MW2SfD3YfomR9R6wljspun6ioq2Bh1VcoiHAK6LyqDH7QXc
	x9LUwwR72cQgNzhGLuN8nVRUCmdTE0aCYFNaCr80MrabUEju0EctFA9LzquNXyh2gUWoAmTd6nJ
	yzwspFP2Hx9a2mn5VggtRuMcf2mca58p7pWo5RfFr4OR07lKZ5bWnh9yMxenJtLxn
X-Gm-Gg: AYBFou1Ew5r043ft10U2mbaBu02TW0tWjpqFxhVHJLP94tj0dBUs1o2u16EczPmiwjQ
	zbh1XPuY51SDi72Y4tXULes31TBGpkNctXV73ZTmRuIVXiZ7aL/hZ4SM0SCJmmKlWnRj5x+Lfj7
	cxIlq98nzFnChVi3EPpYnmAm8lMALM57YUQ6A5+CMACUocGYtNRQXyjzbgvnEHlX2yLXwnSRzRh
	Azgb9sh07mpQI1YyMhecNQYiMF65XMQxslzRnxmqL8DfBPsKORSdJrueycr4hQEaVkgkPzhWQ/J
	0z0pIfDhuPrZsFChB/tAO7ZcpwssKWRJ67mkX59MbzoatAhteIxftGENFI0Nu2OI2nkB/QEV5gu
	e9snoeDYG4+h9w6ee
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1235316785a.66.1792405676743;
        Mon, 19 Oct 2026 03:27:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1235312585a.66.1792405676047;
        Mon, 19 Oct 2026 03:27:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm22598388f8f.49.2026.10.19.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:27:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
Message-ID: <erslpqpbwzkbozzrqigm7mbud4vldncmppdaygjl4dwdnpx6gn@g2qbgvyahae6>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FSjnunV4Zqd4zwKtXqL-eU8aWEdiH1Go
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX/JYYm1AEMkaU
 u14ioD92jCLy/8FonCjDzIa41QcDsveCKtzyNpscAMY75d9wsuqmetBQSkRDyfhKuftT+QFQ4Ef
 RTSg4hSW9eCyRqh0HUowHS8eLCZYARs3Y/P8xCHa3jK+z7sEkgYzdHgdgjPfQjKnCYWHULUMoTU
 QxAXzLUugQfvYPegXw8QU1sTD8wIHkBcoc3uMHjatNA/fXkbvFEIfHgO8VSdWv99pjyB/EVHjK5
 YkR/qFz5yIogG6fkNRvcbNhIWTPYKLsE/fqeL0AaCH6ZZ/6OB90fCNyAdB+6xpfCSP01OaMDqUY
 616Pnkp5FVZCqOfx6a0TNyP9u8xFEROum0YMyiQ15l1cUbZ+4YafAudJ4NV4bgbTYcENCzQjpGD
 Ln4y093zI4BppmnmxpCPSGu51HhL0y/vZFEWXljzZw8BNGtSlpp1J181MsdGFgRhF6JF4yV4zfc
 WvL3+XsXHMnN7ZltNog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX2wKhnsKtY70u
 HUvFThYF7SY239xz89xciH2Q7FrOlod1EQjlq3f15BYdcLHgJBmthf8tuB1mYvuRARKxk62ytxb
 DTcJ6Qvzd6GqcSZBnlFbfs9ypyK3rgQ=
X-Proofpoint-GUID: FSjnunV4Zqd4zwKtXqL-eU8aWEdiH1Go
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5f0ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VheN6w7Iy05UrgdZvFwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-18 19:15:47, Peter Chen wrote:
> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
