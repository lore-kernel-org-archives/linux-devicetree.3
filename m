Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F17418362
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751372; cv=none; b=YFs3eglFAXpU6xe/UZOPP6bP5kubReb8x9dIS0arrYkrLowW9yVpWApnxVST93fFoAteGqaEKiyD+Z0v6nnYh5oluhBh3WeAWpTSlfuWf3Pwk0aVoxxgURexpxWrNfYlsbW5gE/6PngUFJVsCctj/gPPqP0zI3ujt9DAggnOFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751372; c=relaxed/simple;
	bh=QmocaZI6v8/HE3l87P6BrE5F5pxhD/tOiaWeLGuWBWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjoM9aQwfPWUCLRzrq6YWALRPLPZ2J9RVCaVhrf949LfmXoiF+cFyj/0FQ9r7c07TW2SSGyDXQZSiaKvV+D+wC7gTco4L+8TGMEV3yQTBKLtRp44Ne6f7ujYvVzRanD4jm2oLzEkVw5vFCFfTL/b7yqNrTMB79iKxv1Rz/a7Kic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TC3kMFvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5IB4Obc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TC3kMFvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5IB4Obc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBjO71909131
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtbNasJFgGUrBr6ZNQv/nV3AmOlHHVHM0xaDt+EtLes=; b=TC3kMFvQwcR1KUar
	tBf53nSU5HufBqyhq9/iAZeP3xH1LWaMCxGFkIToqNPQ+OfGIGjuTDAmE+acvd0L
	EXMdcpF/Fl+nOFSexpLY8+NlZucIyURHx/N7RJgKPVeoZ66CKtSGjn+INfEFr3DM
	eNS2zNR8pN/D3plCXPJHlVzExvo+yh88hn8ygPgbae8pXss5zhj89pA2GJSF6+bo
	aKdfgqSbSkeL9aAKYyNpQ3wVpqgPrU1oGq55KAZ/PmXVS90tiCmydoBF1w1z11tK
	84XX7YfWDWr272pXrHDa502jSPj8HJMw6NtAQTPDJ36GLPOxYYo9RTq37Pfe04h7
	hFfixw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1sfjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:36:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d827597fbso9719761cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751369; x=1788356169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtbNasJFgGUrBr6ZNQv/nV3AmOlHHVHM0xaDt+EtLes=;
        b=W5IB4Obc+9i7RISxM10nwAAGCMETmRofbUAxz3PVR8R8SfjSEHq6l3diOuD+RBTKgn
         FBFljWO+alyWx1G4LAOOtJUNKk5wTbi715JZTNlF4UF4ybBFvy1S2+eDx7fICNh+dOzY
         jH31JLb4C0cRIVtCWjgdm3hhKfCwQupZacqCvE3MwwzfafTSWpNm8uHgNikbPlVqzVNy
         1M6YUscwN7heNFy9SqfD3ZbJQsGa+pjCz0ZzVSd5TNzItfHwmhMJFgNY3QCdtJzofKCU
         PxtPHuC5UEGInxNjtvNsmZNoJo2X/2RH9fJTjaEdOp2+ZIGRKSXKwtdW71CFoBKgP4D1
         BZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751369; x=1788356169;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtbNasJFgGUrBr6ZNQv/nV3AmOlHHVHM0xaDt+EtLes=;
        b=jNogoLGzGLCp64JeDqM8ePUZTyD702GEKu2p8wUIz9SJw/OHH9sxXQkHmV9sedoVVD
         Hk+FGQnVc7dO85OGW5l4cpixd14ndH2QdCuKlisICueTAMxCnwpS4ivPX7ka7EqI8Vpl
         aaDj/KYsflXkWx7DH+MawcbV8b9tIoHWWi3iCyv7JdvfHNtkUNEI9gOkFLZw592tFRFv
         xKoeDL+TX0HFYVmQqSAf1Vcak7eF5fChmB6k/DRwnOVvp8CQycfalGRt3CFJikaBaYmw
         ucvtDXG/Nipa3VZalR20dL0uAcH87cNnJVVnrS9DYKcY98r5EB1YEbjNDbT19nTxsf9G
         0VxA==
X-Forwarded-Encrypted: i=1; AHgh+RoNe0JLK2lLsE8S/k2v8EXLndd/aXusD1n1uIBZtQH0n0Uqmp9HMIg5IpaNaV2tUxl9JA/n5HUmCGuP@vger.kernel.org
X-Gm-Message-State: AFuF++nG52ZdxKBYJ5oMOG9aye9J0OpJl8A7r2xCsGh29+C//hWmKVzV
	KUSiZxIVA+yUMiG28D4yQdN+CSyKkikHELPGc/XffJg9tRobQg+ur9XMZwxA0itjdk21Puvg0hr
	1RIxvFCUlVoU6Pn91oP74Em/+LNQWgxCuY3Xa+o9jtKuyJRYp6YDMbgRhZ3I9Ccwi
X-Gm-Gg: AR+sD109uM8M7XL9HZq7uiDatyLbWS+W16yGWmpcKaB6Ou1jMgKtlOnZIYqotSewiP+
	bnWIyR+JxXvLfJkE/KcAereik7ReHGjxfyofHSkpVfyxaS693V9f502t+bTdoJD5qgvRHKftqd3
	wC9ibw2OJIgqhnRTQGBxsZ7yXOivbQAA6lgO2DXxm3ukhSvOG6KgSsiJs9azc7d2r6nRCv/PWki
	IqNH568dvUd1Yh7EAYpXlMviecwb/IM5sbD6AjtbsV4aGYbNmMunl6DgeG2xClSEuSoNVFtqy6r
	lQlBHyYM/hDc960A8pUOF15Hdo/mFUXfuQ3do3T9SvdQLt1SVZL1fe/DR/fWQuYvE/cdJHSr/qg
	lgEARm+h/uL4uyZ7WMkCIazhJ/IFe
X-Received: by 2002:ac8:7e8d:0:b0:52d:918b:92e2 with SMTP id d75a77b69052e-52e4222c9c4mr65526471cf.6.1787751369470;
        Wed, 26 Aug 2026 06:36:09 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:52d:918b:92e2 with SMTP id d75a77b69052e-52e4222c9c4mr65525671cf.6.1787751368956;
        Wed, 26 Aug 2026 06:36:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac6848sm4241597a12.24.2026.08.26.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:36:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Vincent Jardin <vjardin@free.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes
Date: Wed, 26 Aug 2026 15:36:03 +0200
Message-ID: <178775135167.59974.3175539480140201865.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825-for-upstream-dt-qoriq-gpio-hog-v3-1-b99bda4f44d7@free.fr>
References: <20260825-for-upstream-dt-qoriq-gpio-hog-v3-1-b99bda4f44d7@free.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RwZYEwNYU8iCRQKCeB4dM5OZKcCg9hDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX/0F3+o02v7jp
 oehw1yE+XTDsJBOEzw2OSqke6NVBuAlCRxAEFd/5/3h2Ry1NqkGvmPaFINf7O6BsdPSETFRcqws
 fz6wG7xubtYgFdPnhcaQ34F0Dy9avIdB3bBSOba+v6MZ/noNHvMwSXZDcQcW09kP934oBiqgaZs
 l+b78LUJM8EZQPEtQPW7dGi7/hkkkwtBti8m29UsjaU4VzI4lEtWYCdB3burd/LF5irbtk8qNd4
 atErV1gMJEy5loIEiAco7FxHSZIdzzYRtcpAgIBYhyJruLQTSwKR5czsRT9VKISGsppvz8T6pih
 6zZmHqzeWZvWQjm21hEBvTmYO9ihH9Hvw3oh5hkyFx8R8zO4Rv1nShG+dO860deyMTt1EOd8lcN
 mQmbwGGM1f2RnzftHI6EwW99yHvNSr8lW6vxM0Ro1u2tbBTzS8oCkMp6fAydC17mr7d92Ta4q7B
 M7JkTDK2ccbnmQmFd3g==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8eebca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VIjY3HyipIfhJr2Qx8cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RwZYEwNYU8iCRQKCeB4dM5OZKcCg9hDb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX+7xKkAfcipdd
 HTCHAs/w7gp7aUONA4IFjrlFOFcyTp7wPOk5WE7gvOzRPTvBodUTZClZ3w09Ma8hQU9Cx/Rl9Zy
 BsK+4qn3h/DTQV+8Gs//C7v9w25Mi+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260112


On Tue, 25 Aug 2026 11:41:57 +0200, Vincent Jardin wrote:
> QorIQ GPIO controllers may have hogs in device nodes, so let's expose
> it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes
      https://git.kernel.org/brgl/c/78c0baf85cd0ab61939b6d4670158d5c53dada69

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
